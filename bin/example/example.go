package main

import (
	"net/http"

	_ "github.com/bakins/envexpvar"
)

func main() {
	http.ListenAndServe(":8080", nil)
}
