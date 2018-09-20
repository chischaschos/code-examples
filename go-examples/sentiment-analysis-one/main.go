package main

import (
	"fmt"
	"strings"

	"github.com/machinebox/sdk-go/textbox"
)

func main() {
	machBoxIP := "http://159.89.47.88:8080/"
	client := textbox.New(machBoxIP)
	// positiveStatement := "I am so excited to be teaching to super awesome, fun workshop!"
	negativeStatement := "It is sad, depressing, and unfortunate that this workshop will terminate at the end of the day."
	analysis, err := client.Check(strings.NewReader(negativeStatement))

	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(analysis.Keywords)

	sentimentTotal := 0.0
	for _, sentence := range analysis.Sentences {
		sentimentTotal += sentence.Sentiment
	}

	// Higher sentitment is more positive, and lower is more negative.
	fmt.Println("Sentiment:", sentimentTotal/float64(len(analysis.Sentences)))
}
