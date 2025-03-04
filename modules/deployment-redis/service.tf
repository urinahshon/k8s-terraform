resource "kubernetes_service" "redis" {
  metadata {
    name = "redis-service"
  }

  spec {
    selector = {
      app = "redis"
    }

    port {
      port        = var.redis_port
      target_port = var.redis_port
    }

    type = var.redis_service_type
  }
}
