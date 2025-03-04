variable "redis_name" {
  default = "redis"
}

variable "redis_replicas" {
  type    = number
  default = 3
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "redis_image" {
  default = "redis:7.4.2"
}

variable "redis_limit_cpu" {
  default = "500m"
}

variable "redis_limit_mem" {
  default = "512Mi"
}

variable "redis_requests_cpu" {
  default = "250m"
}

variable "redis_requests_mem" {
  default = "256Mi"
}
variable "redis_service_type" {
  default = "ClusterIP" # Change to NodePort if external access is needed
}