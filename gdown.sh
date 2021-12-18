#!/bin/bash

fileNAME=$1
fileID=$2

rm -rf /tmp/cookies.txt
confirmCode=$(curl -kLc /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=$fileID" | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p');
curl -kLb /tmp/cookies.txt -o $fileNAME "https://docs.google.com/uc?export=download&confirm=$confirmCode&id=$fileID"
