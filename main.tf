resource "kubernetes_namespace" "this" {
  count = var.create_namespace == true ? 1 : 0
  metadata {
    name = var.namespace
    annotations = {
      name = var.namespace
    }
  }
}

resource "helm_release" "this" {
  name       = var.name
  atomic     = var.atomic
  lint       = var.lint
  repository = var.repository
  version    = var.chart_version
  chart      = local.chart
  namespace  = local.namespace
  timeout    = var.timeout
  values     = var.helm_file_override

  dynamic "set" {
    for_each = var.settings
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }

  dynamic "set_sensitive" {
    for_each = var.sensitive_settings
    content {
      name  = set_sensitive.value["name"]
      value = set_sensitive.value["value"]
    }
  }
}

locals {
  chart     = var.chart == null ? var.name : var.chart
  namespace = var.create_namespace == true ? kubernetes_namespace.this[0].id : var.namespace
}
