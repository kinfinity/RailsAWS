#! /usr/bin/env bash

# create bucket for Terraform State 
AWS_ACCESS_KEY_ID='***'
AWS_SECRET_ACCESS_KEY='***'
REGION='us-east-1' 
aws s3 mb "s3://$1"

echo "Checking S3 bucket exists..."                                                                                                                                                                                                           
BUCKET_EXISTS=true                                                                                                                                                                                                                            
S3_CHECK=$(aws s3 ls "s3://${BUCKET_NAME}" 2>&1)                                                                                                                                                 

#Some sort of error happened with s3 check                                                                                                                                                                                                    
if [ $? != 0 ]                                                                                                                                                                                                                                
then                                                                                                                                                                                                                                          
  NO_BUCKET_CHECK=$(echo $S3_CHECK | grep -c 'NoSuchBucket')                                                                                                                                                                                     
  if [ $NO_BUCKET_CHECK = 1 ]; then                                                                                                                                                                                                              
    echo "Bucket does not exist"                                                                                                                                                                                                              
    BUCKET_EXISTS=false                                                                                                                                                                                                                       
  else                                                                                                                                                                                                                                        
    echo "Error checking S3 Bucket"                                                                                                                                                                                                           
    echo "$S3_CHECK"                                                                                                                                                                                                                          
    exit 1                                                                                                                                                                                                                                    
  fi 
else                                                                                                                                                                                                                                         
  echo "Bucket exists"
fi 