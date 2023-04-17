output "cloudflare_record" {
  value = cloudflare_record.this
}

output "kubernetes_limit_range" {
  value = kubernetes_limit_range.this
}

output "namespace" {
  value = local.namespace
}

output "helm_release" {
  value = helm_release.this
}

output "kubernetes_persistent_volume_claim" {
  value = kubernetes_persistent_volume_claim.this
}

output "kubernetes_persistent_volume" {
  value = kubernetes_persistent_volume.this
}
