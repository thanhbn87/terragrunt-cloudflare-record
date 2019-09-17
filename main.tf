provider "cloudflare" {
  email = "${var.cf_email}"
  token = "${var.cf_token}"
}

terraform {
  backend "s3" {}
}

resource "cloudflare_record" "this" {
  count    = "${length(var.records)}"
  domain   = "${var.domain_name}"
  name     = "${element(var.records[count.index], 0)}"
  value    = "${element(var.records[count.index], 1)}"
  priority = "${element(var.records[count.index], 2)}"
  type     = "${element(var.records[count.index], 3)}"
  proxied  = "${element(var.records[count.index], 4)}"
}
