# Upload local files to AWS S3 bucket, only then delete local copy
find /home/ec2-user/data/csv -type f | while read -r FILE; do
  aws s3 cp "$FILE" s3://raminorujov-s3-bucket
  if [ $? -eq 0 ]; then
    echo "$FILE successfully uploaded at $(date +'%d-%m-%Y-%H-%M-%S')"
    rm -f "$FILE"
  else
    echo "$FILE ERROR: failed to upload file $FILE at $(date +'%d-%m-%Y-%H-%M-%S')"
    exit 1
  fi
done
