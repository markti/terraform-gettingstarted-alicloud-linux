
provider "alicloud" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
resource "alicloud_vpc" "vpc" {
  name       = "main-vpc"
  cidr_block = "172.16.0.0/12"
}