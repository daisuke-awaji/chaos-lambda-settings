#!/bin/bash
while :
do
  count=`ps -ef | grep nginx | grep -v grep | wc -l`;

  if [ $count = 0 ]; then
    INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id);
    /usr/bin/aws elbv2 deregister-targets --target-group-arn arn:aws:elasticloadbalancing:us-east-1:703976800898:targetgroup/dev-web-target-group/f4813c42e3f09807 --targets Id=${INSTANCE_ID} --region us-east-1
  fi
done
