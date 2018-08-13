
provider "alicloud" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "alicloud_instance_types" "2c4g" {
  cpu_core_count = 2
  memory_size = 4
}

# Create a web server
resource "alicloud_instance" "web" {

  # Like on AWS, Machine images are scoped to a region
  image_id          = "${var.image_id}"
  internet_charge_type  = "PayByBandwidth"

  instance_type        = "${data.alicloud_instance_types.2c4g.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "web"
  vswitch_id = "${alicloud_vswitch.vswitch-a.id}"

}