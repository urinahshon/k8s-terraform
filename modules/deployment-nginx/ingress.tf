resource "kubernetes_ingress_v1" "web" {
  metadata {
    name = "web-ingress"
    namespace = kubernetes_namespace.web_ns.metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = "web.local"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "web-service"
              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}
