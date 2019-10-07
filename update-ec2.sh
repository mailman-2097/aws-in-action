#! /bin/bash -xe
PUBLICIPADDRESSES="$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].PublicIpAddress" --output text)"
for PUBLICIPADDRESS in $PUBLICIPADDRESSES; do
  ssh -i /home/nishad/mykey.pem -t "ec2-user@$PUBLICIPADDRESS" "sudo yum -y --security update"
done