#!/bin/bash -ex

VpcId="$(aws ec2 describe-vpcs --filter "Name=isDefault, Values=true" --query "Vpcs[0].VpcId" --output text)"
aws cloudformation create-stack --stack-name irc --template-url https://s3.amazonaws.com/awsinaction-code2/chapter05/irc-cloudformation.yaml --parameters "ParameterKey=VPC,ParameterValue=$VpcId"

# Create security group beginning with IRC
aws cloudformation wait stack-create-complete --stack-name irc
# aws cloudformation delete-stack --stack-name irc
