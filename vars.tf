variable "cf_email" {}
variable "cf_api_key" {}
variable "cf_api_token" { default = "" }

variable "domain_name" {}
variable "records" {
  type    = list
  default = [
    ["www","10.10.10.10","0","A","false"]
  ]
}

variable "cf_ttl" {
  type    = string
  default = "1"
}
