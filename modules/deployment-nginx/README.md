# Deploying Minikube with Terraform deployment

This project sets up a local Kubernetes cluster using **Minikube** and deploys web application servers using **Terraform**.
It also includes an ingress controller for dynamic traffic routing.

---

## **Prerequisites**
Ensure you have the following installed:
- [Homebrew](https://brew.sh/) (for macOS users)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)

---

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
- Use `kubectl logs <pod-name> -n redis-namespace` for troubleshooting.