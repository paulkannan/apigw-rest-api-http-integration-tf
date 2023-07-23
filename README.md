# apigw-rest-api-http-integration-tf

The Terraform template deploys an Amazon API Gateway REST API endpoint with a simple public HTTP endpoint integration.

Learn more about this pattern at Serverless Land Patterns: https://serverlessland.com/patterns/apigw-rest-api-http-integration

Important: this application uses various AWS services and there are costs associated with these services after the Free Tier usage - please see the AWS Pricing page for details. You are responsible for any AWS costs incurred. No warranty is implied in this example.

Requirements
  - Create an AWS account if you do not already have one and log in. The IAM user that you use must have sufficient permissions to make necessary AWS service calls and manage AWS resources.

  - AWS CLI installed and configured

  - Git Installed

  - Terraform installed

  - Deployment Instructions

    Create a new directory, navigate to that directory in a terminal and clone the GitHub repository:
    git clone https://github.com/aws-samples/serverless-patterns/apigw-rest-api-http-integration-tf

  - Change directory to the pattern directory:

    cd apigw-rest-api-http-integration-tf
    
From the command line, use AWS Terraform to deploy the AWS resources for the pattern as specified in the template.yml file:

  - terraform init
  - terraform plan -out="tfplan"
  - terraform apply -var-file="variables.tfvars"
    
During the prompts:

  - Enter a stack name
  - Select the desired AWS Region
  - Input the HTTP endpoint URL for the integration, i.e. https://example.com
  - Allow Terraform to create roles with the required permissions if needed.


Note the outputs from the Terraform deployment process. These contain the resource names and/or ARNs which are used for testing.

Testing
The stack will output the api endpoint. Visit that URL in your browser or make an HTTP request to the endpoint using curl to test the HTTP integration.

Cleanup
- Delete the stack
  terraform destroy
- Confirm the stack has been deleted
  aws cloudformation list-stacks --query "StackSummaries[?contains(StackName,'STACK_NAME')].StackStatus"
