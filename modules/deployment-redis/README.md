# Terraform Kubernetes Deployment on Minikube

This project provides a Terraform configuration to deploy a Redis instance on a local Minikube Kubernetes cluster.

## Prerequisites

## **Prerequisites**
Ensure you have the following installed:
- [Homebrew](https://brew.sh/) (for macOS users)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)

---

## Deployment Overview

The Terraform configuration creates:
- A Kubernetes namespace for Redis.
- A Redis deployment with configurable replicas.
- Resource limits and requests for CPU and memory.

## Configuration Variables

## Usage

### 1. Start Minikube
Ensure Minikube is running:
```sh
minikube start
```

### 2. Initialize Terraform
```sh
terraform init
```

### 3. Plan the Deployment
We can create the variables in a `terraform.tfvars` file or pass them by parameter -var-file

```sh
terraform plan -var-file="terraform.tfvars"
```

Or use default
```sh
terraform plan
```

### 4. Apply the Deployment
```sh
terraform apply -auto-approve
```

### 5. Verify Deployment
Check the pods running in the namespace:
```sh
kubectl get pods -n redis-namespace
```

### 6. Cleanup
To destroy the deployment:
```sh
terraform destroy -auto-approve
```

## Notes
- Ensure Minikube has enough resources allocated (`minikube config set memory 4096` for example).
- Modify variables in `terraform.tfvars` or override them using `-var` flags.
- Use `kubectl logs <pod-name> -n redis-namespace` for troubleshooting.
