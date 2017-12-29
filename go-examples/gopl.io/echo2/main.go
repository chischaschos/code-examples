package main

import (
	"fmt"
	"os"
)

func main() {
	var s, sep string
	for _, a := range os.Args[1:] {
		s += sep + a
		sep = " "
	}
	fmt.Println(s)
}
