package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println(joinExplicit(os.Args[1:]))
}

func joinExplicit(args []string) string {
	var s, sep string
	for i := 0; i < len(args); i++ {
		s += sep + args[i]
		sep = " "
	}
	return s
}

func joinStringsJoin(args []string) string {
	return strings.Join(args, " ")
}
