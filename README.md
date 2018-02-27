# go-lambda-ping

A simple program that will build the infrastructure to ping a website.

## Configuring the Site

Change `url = "http://example.com/"` to `url = "<desired-site>"` in `terraform.tfvars`.

## Building the Zip

In the `function` directory run `make release` to generate the binary and then zip it.

## Deploying the Lambda

1. Run `terraform init` to initialize the terraform repository.

2. Then run `terraform plan` to create the execution plan.

3. Finally, `terraform apply` to apply the changes (run the execution plan).


## Trigger the Lambda
```
aws lambda invoke \
--invocation-type RequestResponse \
--function-name demo_lambda \
--region us-east-1 \
--log-type Tail \
--payload '{"key1":"value1", "key2":"value2", "key3":"value3"}' \
outputfile.txt
```
