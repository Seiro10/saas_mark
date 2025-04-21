# Hangman SaaS - Full Stack Infra & App on AWS

This project is a full-stack web-based Hangman game deployed on **AWS** using **Terraform**, **EKS (Kubernetes)**, **FastAPI** for the backend, and **React (Vite)** for the frontend.

It’s built for learning and production-readiness — designed for **cloud-native deployment**, with infrastructure-as-code and modern DevOps principles.

## Tech Stack

| Layer         | Tech                        |
|---------------|-----------------------------|
| Infra         | Terraform,VPC, ALB, Ingress |
| Backend       | FastAPI (Python)            |
| Frontend      | React + Vite (JavaScript)   |
| Orchestration | Kubernetes (EKS)            |

## Structure

![image](https://github.com/user-attachments/assets/676b8295-d43a-4180-b80a-dac2b685a4e3)


## Infrastructure Deployment (Terraform)

### Prerequisites

- AWS CLI configured (`aws configure`)
- IAM user with `ec2`, `eks`, `iam`, and `vpc` permissions
- Terraform ≥ v1.3

### 1. Configure variables

Edit `infra/terraform.tfvars`:

```hcl
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones = ["eu-west-3b", "eu-west-3c"]
name_prefix        = "hangman"
cluster_name       = "hangman-cluster"
```

### 2. Deploy infrastructure

```bash
cd infra
terraform init
terraform apply
```

This will create:

- VPC + Subnets
- Internet Gateway + NAT
- EKS Cluster + Node Group
- Security Groups
- Route Tables
- ALB for future ingress

## Backend Setup (FastAPI)

### Local run

```bash
cd backend
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```
Accessible at: http://localhost:8000/state

### Docker

```bash
docker build -t hangman-backend .
docker run -p 8000:8000 hangman-backend
```
## Frontend Setup (React + Vite)

### Local run

```bash
cd frontend
npm install
echo "VITE_API_URL=http://localhost:8000" > .env
npm run dev
```

### Docker

```bash
docker build -t hangman-frontend .
docker run -p 5173:80 hangman-frontend
```

