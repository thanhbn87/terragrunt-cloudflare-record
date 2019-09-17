variable "cf_email" { default = "admin@example.com" }
variable "cf_token" {}

variable "domain_name" { default = "example.com" }
variable "records" {
  default = [
    ["www","10.10.10.10","0","A","false"]
  ]
}
