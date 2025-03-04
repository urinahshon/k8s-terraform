resource "kubernetes_service" "web" {
  metadata {
    name = var.web_name
    namespace = kubernetes_namespace.web_ns.metadata[0].name
  }

  spec {
    selector = {
      app = var.web_name
    }

    port {
      port        = var.service_port
      target_port = var.service_port
    }

    type = var.web_service_type
  }
}
