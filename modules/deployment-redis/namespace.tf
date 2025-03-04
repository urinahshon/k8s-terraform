resource "kubernetes_namespace" "redis_ns" {
  metadata {
    name = "redis-namespace"
  }
}