variable "cf_email" {}
variable "cf_token" {}

variable "domain_name" { default = "example.com" }
variable "records" {
  default = [
    ["www","10.10.10.10","0","A","false"]
  ]
}
