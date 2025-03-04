variable "web_name" {
  default = "web-app"
}

variable "web_count" {
  type    = number
  default = 3
}

variable "image" {
  default = "nginx:1.27-perl"
}

variable "container_port" {
  type    = number
  default = 80
}

variable "service_port" {
  type    = number
  default = 80
}

variable "web_service_type" {
  default = "NodePort" # Change to ClusterIP if internal access is needed
}

variable "env_vars" {
  default = {}
}
