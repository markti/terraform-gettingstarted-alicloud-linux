# Correlates to an AWS 'VPC'
resource "alicloud_vpc" "vpc" {
  name       = "main-vpc"
  cidr_block = "10.0.0.0/16"
}
# Correlates to an AWS Subnet
resource "alicloud_vswitch" "vswitch-a" {
  vpc_id = "${alicloud_vpc.vpc.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${var.region}-b"
}
# Correlates to an AWS Security Group
resource "alicloud_security_group" "default" {
  name        = "default"
  description = "default"
  vpc_id = "${alicloud_vpc.vpc.id}"
}