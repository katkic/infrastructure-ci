#!/bin/sh

CFN_STACK_NAME=RaiseTech-cfn
FILE_PATH=cloudformation

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}" \
--template-file "${FILE_PATH}/rt_vpc.yml"

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-sg" \
--template-file "${FILE_PATH}/rt_sg.yml"

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-iam" \
--template-file "${FILE_PATH}/rt_iam.yml" --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-ec2" \
--template-file "${FILE_PATH}/rt_ec2.yml" --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-elb" \
--template-file "${FILE_PATH}/rt_elb.yml"

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-s3" \
--template-file "${FILE_PATH}/rt_s3.yml"

aws cloudformation deploy --stack-name "${CFN_STACK_NAME}-rds" \
--template-file "${FILE_PATH}/rt_rds.yml"
