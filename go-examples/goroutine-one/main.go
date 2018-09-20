package main

import (
	"fmt"
	"time"
)

func printNum(from string) {
	for i := 1; i < 5; i++ {
		fmt.Printf("%s output: %d\n", from, i)
		time.Sleep(1 * time.Second)
	}
}

func main() {
	go printNum("goroutine 1")
	go func() {
		fmt.Println("goroutine 2 output")
	}()

	time.Sleep(4 * time.Second)
}
