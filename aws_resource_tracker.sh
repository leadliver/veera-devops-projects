#!/bin/bash

#########################################
#Author- Tapas
#Date- 13/04/2024
#Version- Beta
#Purpose- Report AWS resource usage (RealTime UseCase)
###################################################################

#AWS EC2
#AWS S3
#AWS Lambda
#AWS IAM


set -x
set -e
set -o pipefail

# list s3 buckets
echo "s3 buckets:-"
aws s3 ls > resource_tracker

# list ec2 instances
echo "ec2 instances:-"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resource_tracker


# list lambda functions
echo "lambda functions:-"
aws lambda list-functions >>  resource_tracker


# list IAM Users
echo "IAM users:-"
aws iam list-users | jq ' .Users[].UserId' >>  resource_tracker
