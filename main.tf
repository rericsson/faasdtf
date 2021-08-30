terraform {
    required_providers {
        hcloud = {
            source = "hetznercloud/hcloud"
        }
    }
}

# variable from .tfvars
variable "hcloud_token" {
    sensitive = true
}

provider "hcloud" {
    token = var.hcloud_token
}

data "template_file" "cloud_init" {
    template = "${file("cloud-init.tpl")}"
}

resource "hcloud_server" "foo" {
    name = var.server_name
    image = "ubuntu-20.04"
    server_type = var.server_type
    ssh_keys = [var.ssh_key]
    user_data = data.template_file.cloud_init.rendered
}
