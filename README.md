# hackaton2022

## Prerequisites   


> This is usual terraform setup. Please refer to terraform manual if unsure.  

1. Make sure to add profile to your ~/.aws/credentials file.
2. unset AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN - anything that may take precedence over your default profile.
3. test if the desired credentials are used by `AWS_DEFAULT_PROFILE='kk-hackaton' aws sts get-caller-identity` 

## Apply the code

```
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

AWS_DEFAULT_PROFILE='kk-hackaton' terraform init
AWS_DEFAULT_PROFILE='kk-hackaton' terraform plan
AWS_DEFAULT_PROFILE='kk-hackaton' terraform apply

```

* in case you want to cherry pick resources, use the following

```
AWS_DEFAULT_PROFILE='kk-hackaton' terraform apply -target aws_iam_role.DangerousLambdaRole -target aws_iam_role.DangerousInstanceProfileRole
```