package main

import (
	"fmt"
	"time"
)

func main() {
	workers := 20
	results := make(chan string, workers)

	for w := 0; w < workers; w++ {
		output := fmt.Sprintf("Worker %d output", w)
		go func(output string) {
			time.Sleep(1 * time.Second)
			results <- output
		}(output)
	}

	for i := 0; i < workers; i++ {
		p := <-results
		fmt.Println(p)
	}

}
