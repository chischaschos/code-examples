package main

import (
	"fmt"
	"unsafe"
)

func main() {
	var x uint32 = 0x01020304
	switch *(*byte)(unsafe.Pointer(&x)) {
	case 0x01:
		fmt.Println("Big Endian")
	case 0x04:
		fmt.Println("Little Endian")
	}
}
