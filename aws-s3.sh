#/bin/bash

date=$(date +%H-%M-%S)
BACKUP=db$date.sql
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

echo $BUCKET_NAME
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db$date.sql

export AWS_ACCESS_KEY_ID=AKIARYYB2YQJOPUEABPX && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your $BACKUP backup" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP
