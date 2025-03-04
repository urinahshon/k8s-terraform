
module "web" {
  source       = "./modules/deployment-nginx"

  web_count    = 2  # Number of NGINX replicas
  service_port = 80 # Port number of web
}

module "redis" {
  source         = "./modules/deployment-redis"

  redis_replicas = 3 # Number of Redis replicas
  redis_port     = 6379 # Port number of Redis
}
