packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "ubuntu" {
  project_id   = "packer-image-project"
  zone         = "asia-south1-a"
  machine_type = "e2-micro"

  source_image_family     = "ubuntu-2204-lts"
  source_image_project_id = ["ubuntu-os-cloud"]

  ssh_username = "packer"

  image_name = "learn-packer-gcp-ubuntu-{{timestamp}}"
}

build {
  name    = "learn-packer-gcp"
  sources = ["source.googlecompute.ubuntu"]
}
