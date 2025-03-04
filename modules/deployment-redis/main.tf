resource "kubernetes_deployment" "redis" {
  count = var.create_redis # Only create the deployment if create_redis is 1
  metadata {
    name = var.redis_name
    namespace = kubernetes_namespace.redis_ns.metadata[0].name
    labels = {
      app = var.redis_name
    }
  }

  spec {
    replicas = var.redis_replicas

    selector {
      match_labels = {
        app = var.redis_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.redis_name
        }
      }

      spec {
        container {
          image = var. redis_image
          name  = var.redis_name

          port {
            container_port = var.redis_port
          }

          resources {
            limits = {
              cpu    = var.redis_limit_cpu
              memory = var.redis_limit_mem
            }
            requests = {
              cpu    = var.redis_requests_cpu
              memory = var.redis_requests_mem
            }
          }
        }
      }
    }
  }
}
