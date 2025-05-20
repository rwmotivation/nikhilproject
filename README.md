#Outputs:

api_url = "https://u62rfo80c0.execute-api.us-east-1.amazonaws.com"
lambda_function_name = "welcome_lambda_function"
# CDX Platform Engineer Evaluation – AWS DevOps Project

```markdown
# CDX Platform Engineer Evaluation – AWS DevOps Project

This project demonstrates Infrastructure as Code (IaC), CI/CD automation, and AWS PaaS deployment using Terraform, GitHub Actions, and AWS services like Lambda and API Gateway.

---

## 📌 Goals

- Provision AWS PaaS using Terraform
- Deploy a simple “Welcome to 2024” serverless app
- Secure infrastructure using IAM best practices
- Configure remote Terraform state
- Automate CI/CD pipeline using GitHub Actions
- (Optional) Enable custom domain and SSL/TLS

---

## 📁 Project Structure

```

cdx-eval/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── backend.tf
├── iam.tf
├── lambda.tf
├── apigateway.tf
├── s3\_dynamodb.tf
│
├── function/
│   └── app.py
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
└── README.md

```bash

---

## ⚙️ Pre-requisites

- AWS CLI configured locally
- Terraform CLI v1.0+ installed
- GitHub account and repository
- IAM user with programmatic access (with permissions to Lambda, IAM, S3, API Gateway)
- Free-tier AWS account

---

## 🧱 Infrastructure Summary

| Component     | Service        | Description                         |
|---------------|----------------|-------------------------------------|
| Compute       | Lambda         | Serverless function to run Python   |
| API Gateway   | HTTP API       | Internet-facing endpoint             |
| IAM           | Role/Policy    | Scoped access for Lambda execution  |
| State Backend | S3 + DynamoDB  | Store Terraform state safely        |

---

## 🚀 How to Deploy

### 1. Clone the repository

```bash
git clone https://github.com/your-username/cdx-eval.git
cd cdx-eval

## 2. Initialize Terraform

```bash
terraform init
```

## 3. Plan the deployment

```bash
terraform plan
```

### 4. Apply the deployment

```bash
terraform apply
```

### 5. Access the application

After deployment, Terraform will output a public **API Gateway URL**. Open it in a browser:

```markdown

https://xyz123abc.execute-api.us-east-1.amazonaws.com/
```

You should see:

```json
{
  "message": "Welcome to 2024"
}
```

---

## 🛠️ CI/CD Pipeline (GitHub Actions)

Located in `.github/workflows/deploy.yml`, the pipeline:

1. Installs Terraform and Python
2. Initializes and validates Terraform
3. Deploys infrastructure and Lambda function

To trigger: Push to `main` branch.

---

## 🧪 Bonus (Optional Tasks)

To enable custom domain and SSL:

* Purchase domain via Route 53 or external provider
* Set up a Route 53 Hosted Zone
* Request an SSL cert via AWS ACM (in us-east-1 for API Gateway)
* Add `aws_acm_certificate`, `aws_apigateway2_domain_name`, and `aws_apigateway2_api_mapping` in Terraform
* Add CNAME or A record in Route 53

---

## 🔒 Security & Well-Architected Notes

* IAM: Least privilege roles created
* API Gateway: Public endpoint exposed with HTTPS
* Lambda: No inline secrets, ZIP deployment
* Terraform state: Stored remotely in S3 with DynamoDB locking
* CI/CD: Encrypted GitHub secrets used for AWS credentials

---

## 🧹 Clean-Up

To destroy all resources:

```bash
terraform destroy
```

---
