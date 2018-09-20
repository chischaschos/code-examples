package main

import (
	"fmt"
)

func main() {
	ch := make(chan string)
	go func() {
		p := <-ch
		fmt.Println("received signal: ", p)
	}()

	// Send a message on the channel.
	ch <- "This is my message"
	fmt.Println("sent signal")

}
