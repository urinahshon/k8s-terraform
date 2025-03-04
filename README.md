# Terraform Kubernetes Deployment on Minikube

This project demonstrates how to use Terraform to deploy a simple web application using NGINX or a Redis service on a Minikube Kubernetes cluster.


## Prerequisites
Before running the Terraform configuration, ensure the following tools are installed:

- **Terraform**: [Install Terraform](https://www.terraform.io/downloads)
- **Minikube**: [Install Minikube](https://minikube.sigs.k8s.io/docs/)
- **kubectl**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Quick Start
**Clone the repository**:

    ```bash
    git clone git@github.com:urinahshon/k8s-terraform.git
    cd k8s-terraform
    ```

## **Installation Steps**

### **1. Install Minikube (macOS)**
```sh
brew install minikube
```

### **2. Start Minikube with Docker Driver**
```sh
minikube start --driver=docker
```

### **3. Enable Ingress Addon**
```sh
minikube addons enable ingress
```

### **4. Verify Pods are Running**
```sh
kubectl get pods -n kube-system
```

---

## **Deploying with Terraform**

### **1. Initialize Terraform**
```sh
terraform init
```

### **2. Preview the Terraform Execution Plan**
We can create the variables in a `terraform.tfvars` file or pass them by parameter -var-file

```sh
terraform plan -var-file="terraform.tfvars"
```

Or use default
```sh
terraform plan
```

### **3. Apply the Terraform Configuration**
```sh
terraform apply -auto-approve
```

---

## **Verify Deployment**

### **1. Check Kubernetes Deployments**
```sh
kubectl get deployments -n web-namespace
```

### **2. Check Services**
```sh
kubectl get services -n web-namespace
```

### **3. Check Ingress**
```sh
kubectl get ingress -n web-namespace
```

### **4. Test Application Access**
Once the ingress is set up, add the Minikube IP to your `/etc/hosts` file:
```sh
echo "$(minikube ip) web.local" | sudo tee -a /etc/hosts
```
Then, test the deployment:
```sh
curl http://web.local
```
Each request should be routed to a different pod dynamically.

---

## **Destroying the Deployment**
To remove all deployed resources:
```sh
terraform destroy -auto-approve
```
To stop and delete the Minikube cluster:
```sh
minikube stop
minikube delete
```

## Notes
- On aws we can expose the service with internal LB
```yaml
annotations:
    service.beta.kubernetes.io/aws-load-balancer-internal: "true"
```
- Modify variables in `terraform.tfvars` or override them using `-var` flags.