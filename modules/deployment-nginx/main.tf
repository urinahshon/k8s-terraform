resource "kubernetes_deployment" "web" {
  count = var.web_count

  metadata {
    name = "${var.web_name}-${count.index}"
    namespace = kubernetes_namespace.web_ns.metadata[0].name
    labels = {
      app = "web-app"
    }
  }

  spec {
    replicas = 1 # This should be 1 cause we are using Terraform count anyway

    selector {
      match_labels = {
        app = var.web_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.web_name
        }
      }

      spec {
        container {
          image = var.image
          name  = var.web_name

          port {
            container_port = var.container_port
          }

          env {
            name  = "POD_NAME"
            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }

          env {
            name  = "POD_IP"
            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }

          command = ["/bin/sh", "-c", "echo \"Pod: $$POD_NAME, IP: $$POD_IP\" > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]

          # The endpoint should route traffic exclusively to pods capable of responding.
          readiness_probe {
            http_get {
              path = "/"
              port = var.container_port
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }
      }
    }
  }
}
