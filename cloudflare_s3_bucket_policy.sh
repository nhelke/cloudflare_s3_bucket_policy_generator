#!/usr/bin/env bash

set -u -e

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 [bucket name]"
  exit 1
fi

bucketname=$1

cat <<JSON
{
  "Id": "Policy1511640003053",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1511639998209",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::$bucketname/*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
JSON
comma=""
for ip in $(curl -s https://www.cloudflare.com/ips-v4); do
echo -en $comma
echo -n "            \"$ip\""
comma=",\n"
done
echo
cat <<JSON
          ]
        }
      },
      "Principal": "*"
    }
  ]
}
JSON