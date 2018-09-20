package main

import "fmt"

func main() {
	nums := []int{1, 2}
	letters := []byte("a")
	fmt.Println(nums)
	fmt.Println(letters)

	for range []bool{false} {
		fmt.Println("WHAAA")
	}
}
