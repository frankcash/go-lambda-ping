package main

import (
	"fmt"
	"net/http"

	"github.com/aws/aws-lambda-go/lambda"
)

func ping() (string, error) {
	url := "http://example.com/"
	resp, err := http.Get(url)
	return fmt.Sprintf("%s returned %s", url, resp.Status), err
}

func main() {
	// Make the handler available for Remote Procedure Call by AWS Lambda
	lambda.Start(ping)
}
