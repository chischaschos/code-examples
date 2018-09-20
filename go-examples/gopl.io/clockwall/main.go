package main

import (
	"fmt"
	"io"
	"log"
	"net"
	"os"
	"strings"
	"time"
)

func main() {
	for _, a := range os.Args[1:] {
		pair := strings.Split(a, "=")
		tz, host := pair[0], pair[1]
		fmt.Println(tz)
		fmt.Println(host)

		go func() {
			conn, err := net.Dial("tcp", host)
			if err != nil {
				log.Fatal(err)
			}
			defer conn.Close()
			mustCopy(os.Stdout, conn)
		}()
	}

	time.Sleep(10 * time.Second)
}

func mustCopy(dst io.Writer, src io.Reader) {
	if _, err := io.Copy(dst, src); err != nil {
		log.Fatal(err)
	}
}
