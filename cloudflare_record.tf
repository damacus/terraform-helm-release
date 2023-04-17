resource "cloudflare_record" "this" {
  for_each = toset(var.ingress)
  zone_id  = var.zone_id
  name     = each.key
  type     = "A"
  value    = var.external_ip
  proxied  = var.proxied
  ttl      = 1
}
