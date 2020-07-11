provider "cloudflare" {
  email     = var.cf_email
  api_key   = var.cf_api_key
  api_token = var.cf_api_token
}

terraform {
  backend "s3" {}
}

data "cloudflare_zones" "this" {
  filter {
    name   = var.domain_name
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "this" {
  count    = length(var.records)
  zone_id  = lookup(data.cloudflare_zones.this.zones[0], "id")
  name     = element(var.records[count.index], 0)
  value    = element(var.records[count.index], 1)
  priority = element(var.records[count.index], 2)
  type     = element(var.records[count.index], 3)
  proxied  = element(var.records[count.index], 4)
  ttl      = var.cf_ttl
}
