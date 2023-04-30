#!/bin/bash
export $(cat .env | xargs)
eval "rm -rf ./build"
eval "mkdir ./build"

eval "cd ./apis"
directories=(*/)

THIS_API_NAME=$1

echo "build-in-$THIS_API_NAME"

if [ -z "$THIS_API_NAME" ]; then
    for API_NAME in "${directories[@]}"
    do
      echo "$API_NAME"
      eval "cd ./${API_NAME%\/}"
      eval "rm -rf ./go.mod"
      eval "cp -R ../../go.mod ."
      eval "go get"
      eval "GOOS=linux GOARCH=amd64 go build -o main main.go"
      # eval "rm -rf ./node_modules"
      # eval "rm -rf ./service"
      # eval "rm -rf ./util"
      # eval "rm -rf ./env.mjs"
      # eval "rm -rf ./.env"
      # eval "rm -rf ./awsConfig.json"
      # eval "rm -rf ./rds-combined-ca-bundle.pem"
      # eval "mkdir ./node_modules"
      # eval "cp -R ../../node_modules ."
      # eval "cp -R ../../service ."
      # eval "cp -R ../../util ."
      # eval "cp -R ../../package.json ."
      # eval "cp -R ../../.env ."
      # eval "cp -R ../../awsConfig.json ."
      # eval "cp -R ../../env.mjs ."
      # eval "cp -R ../../rds-combined-ca-bundle.pem ."
      eval "zip -r ../../build/${API_NAME%\/}.zip ./main"
      eval "cd ../"
    done
else
      echo "this-$THIS_API_NAME"
      eval "cd ./${THIS_API_NAME%\/}"
      eval "rm -rf ./go.mod"
      eval "cp -R ../../go.mod ."
      eval "go get"
      eval "GOOS=linux GOARCH=amd64 go build -o main main.go"
      # eval "rm -rf ./node_modules"
      # eval "rm -rf ./package.json"
      # eval "rm -rf ./service"
      # eval "rm -rf ./util"
      # eval "rm -rf ./env.mjs"
      # eval "rm -rf ./.env"
      # eval "rm -rf ./awsConfig.json"
      # eval "rm -rf ./rds-combined-ca-bundle.pem"
      # eval "mkdir ./node_modules"
      # eval "cp -R ../../node_modules ."
      # eval "cp -R ../../service ."
      # eval "cp -R ../../util ."
      # eval "cp -R ../../package.json ."
      # eval "cp -R ../../.env ."
      # eval "cp -R ../../env.mjs ."
      # eval "cp -R ../../awsConfig.json ."
      # eval "cp -R ../../rds-combined-ca-bundle.pem ."
      eval "zip -r ../../build/${THIS_API_NAME%\/}.zip ./main"
      eval "cd ../"
fi