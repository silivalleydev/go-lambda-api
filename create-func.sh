#!/bin/bash

export $(cat .env | xargs)

API_NAME=$1
eval "mkdir ./apis/$API_NAME"
eval "cp ./temp/* ./apis/$API_NAME"
