# proxy-terraform

## Prepare

### Make a S3 bucket for tfstate

```console
$ S3_BUCKET=proxy-tfstate-678084882233
$ aws s3 mb s3://$S3_BUCKET
$ aws s3api put-bucket-versioning --bucket $S3_BUCKET --versioning-configuration Status=Enabled
$ aws s3api put-public-access-block --bucket $S3_BUCKET --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
```

### Generate key pair

```console
$ ssh-keygen -t rsa -f ~/.ssh/proxy-prd-keypair
$ cp -a ~/.ssh/proxy-prd-keypair.pub ./modules/main/files/keypair/
```
