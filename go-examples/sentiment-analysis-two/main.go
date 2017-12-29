package main

import (
	"context"
	"encoding/json"
	"fmt"
	"net"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"sync"
	"time"

	"github.com/garyburd/go-oauth/oauth"
	"github.com/machinebox/sdk-go/textbox"
)

// Tweet is a single tweet.
type Tweet struct {
	Text  string
	Terms []string
}

// TweetReader includes the info we need to access Twitter.
type TweetReader struct {
	ConsumerKey, ConsumerSecret, AccessToken, AccessSecret string
}

func getSentiment(text string) float64 {
	machBoxIP := "http://159.89.47.88:8080/"
	client := textbox.New(machBoxIP)
	analysis, err := client.Check(strings.NewReader(text))

	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(analysis.Keywords)

	sentimentTotal := 0.0
	for _, sentence := range analysis.Sentences {
		sentimentTotal += sentence.Sentiment
	}

	// Higher sentitment is more positive, and lower is more negative.
	return sentimentTotal / float64(len(analysis.Sentences))
}

// NewTweetReader creates a new TweetReader with the given credentials.
func NewTweetReader(consumerKey, consumerSecret, accessToken, accessSecret string) *TweetReader {
	return &TweetReader{
		ConsumerKey:    consumerKey,
		ConsumerSecret: consumerSecret,
		AccessToken:    accessToken,
		AccessSecret:   accessSecret,
	}
}

func main() {
	var connLock sync.Mutex
	var conn net.Conn
	client := &http.Client{
		Transport: &http.Transport{
			Dial: func(netw, addr string) (net.Conn, error) {
				connLock.Lock()
				defer connLock.Unlock()
				if conn != nil {
					conn.Close()
					conn = nil
				}
				netc, err := net.DialTimeout(netw, addr, 5*time.Second)
				if err != nil {
					return nil, err
				}
				conn = netc
				return netc, nil
			},
		},
	}

	// Create a new Tweet Reader.
	consumerKey := "ZcxbZfAvSDMQGJ0gzoVL6gqkZ"
	consumerSecret := "sh62QHH9mw5yVs8iZDT2bP5XnIJMfVP3kcGhIaE96awV1Wu8xL"
	accessToken := "15161494-2uCnXyccCGZmIJ6hWEmpmVxAs76GQUxni7wBihh4k"
	accessSecret := "9NjcXJdMbwKhvzt4ptpuMd9dLEOiJWvWNGAHId2KMOT2L"
	r := NewTweetReader(consumerKey, consumerSecret, accessToken, accessSecret)

	creds := &oauth.Credentials{
		Token:  r.AccessToken,
		Secret: r.AccessSecret,
	}

	// Create an oauth Client.
	authClient := &oauth.Client{
		Credentials: oauth.Credentials{
			Token:  r.ConsumerKey,
			Secret: r.ConsumerSecret,
		},
	}

	terms := []string{"Trump", "Russia"}
	form := url.Values{"track": terms}
	formEnc := form.Encode()

	// Create a new HTTP request.
	u, err := url.Parse("https://stream.twitter.com/1.1/statuses/filter.json")
	if err != nil {
		fmt.Println("Could not parse url:", err)
	}

	req, err := http.NewRequest("POST", u.String(), strings.NewReader(formEnc))
	if err != nil {
		fmt.Println("creating filter request failed:", err)
	}

	// Set some header info.
	req.Header.Set("Authorization", authClient.AuthorizationHeader(creds, "POST", u, form))
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("Content-Length", strconv.Itoa(len(formEnc)))

	// Do the request.
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Error getting response:", err)
	}
	if resp.StatusCode != http.StatusOK {
		fmt.Println("failed with status code:", resp.StatusCode)
	}

	// Create a new decoder for the response body.
	decoder := json.NewDecoder(resp.Body)
	tweets := make(chan Tweet)
	ctx, _ := context.WithTimeout(context.Background(), 2*time.Second)

	go func() {
		for {
			select {
			case <-ctx.Done():
				return
			case t := <-tweets:
				fmt.Println(getSentiment(t.Text))
				fmt.Println("----------------------------------------\n")
			}
		}
	}()

	// Start reading in tweets and parsing them.
	go func() {
		for {
			var t Tweet
			if err := decoder.Decode(&t); err != nil {
				break
			}
			tweets <- t
		}
	}()

	time.Sleep(3 * time.Second)
	// Close the response body.
	resp.Body.Close()
}
