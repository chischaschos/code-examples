package main

import (
	"strconv"
	"testing"
)

func BenchmarkJoinExplicit(b *testing.B) {
	var args []string

	for i := 0; i < b.N; i++ {
		args = append(args, strconv.Itoa(i))
		joinExplicit(args)
	}
}

func BenchmarkJoinStringsJoin(b *testing.B) {
	var args []string

	for i := 0; i < b.N; i++ {
		args = append(args, strconv.Itoa(i))
		joinStringsJoin(args)
	}
}
