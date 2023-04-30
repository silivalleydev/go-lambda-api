package main

import (
    "context"
    "encoding/json"
    "github.com/aws/aws-lambda-go/events"
    "github.com/aws/aws-lambda-go/lambda"
)

type Response struct {
    Message string `json:"message"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (*events.APIGatewayProxyResponse, error) {
    response := &Response{
        Message: "Hello, Mengo🥭!",
    }

    body, err := json.Marshal(response)
    if err != nil {
        return nil, err
    }

    return &events.APIGatewayProxyResponse{
        StatusCode:      200,
        IsBase64Encoded: false,
        Body:            string(body),
        Headers:         map[string]string{"Content-Type": "application/json"},
    }, nil
}

func main() {
    lambda.Start(handler)
}
