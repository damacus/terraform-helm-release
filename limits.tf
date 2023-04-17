resource "kubernetes_limit_range" "this" {
  count = var.limit == true ? 1 : 0

  metadata {
    name      = "${local.namespace}-limit-range"
    namespace = local.namespace
  }

  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = "2"
        memory = "1Gi"
      }
    }

    limit {
      type = "Container"
      default = {
        cpu    = "1"
        memory = "1Gi"
      }
    }
  }
}
