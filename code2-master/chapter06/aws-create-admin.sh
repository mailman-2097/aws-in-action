#!/bin/bash -ex
export AccountId="097302305384"
export Password="123456"
export UserId="awsadmin"
aws iam create-group --group-name "admin"
aws iam attach-group-policy --group-name "admin"  --policy-arn "arn:aws:iam::aws:policy/AdministratorAccess"
aws iam create-user --user-name "$UserId"
aws iam add-user-to-group --group-name "admin" --user-name "$UserId"
aws iam create-login-profile --user-name "$UserId" --password "$Password"