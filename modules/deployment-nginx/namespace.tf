resource "kubernetes_namespace" "web_ns" {
  metadata {
    name = "web-namespace"
  }
}