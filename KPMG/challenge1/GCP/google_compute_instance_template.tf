
resource "google_compute_instance_template" "app-template" {
  provider = google-beta
  name        = "backend-template"
  description = "This template is used to create app server instances."
  tags = var.networkTagsApp
  machine_type = var.machineType
  // Create a new boot disk from an image
  disk {
    source_image = "centos-cloud/centos-7"
    auto_delete  = true
    boot         = true
  }
  network_interface {
    network = module.network.network_name
    subnetwork = module.network.subnets_self_links[0]
    /*access_config {
      // Ephemeral IP
    }*/
  }
  service_account {
    email = var.email
    scopes = ["cloud-platform"]
  }
  metadata = {
    enable-oslogin = "TRUE"
    enable-osconfig = "TRUE"
    enable-guest-attributes = "TRUE"
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "google_compute_instance_template" "web-template" {
  provider = google-beta
  name        = "frontend-template"
  description = "This template is used to create web server instances."
  tags = var.networkTagsWeb
  machine_type = var.machineType
  // Create a new boot disk from an image
  disk {
    source_image = "centos-cloud/centos-7"
    auto_delete  = true
    boot         = true
  }
  network_interface {
    network = module.network.network_name
    subnetwork = module.network.subnets_self_links[1]
    /*access_config {
      // Ephemeral IP
    }*/
  }
  service_account {
    email = var.email
    scopes = ["cloud-platform"]
  }
  metadata = {
    enable-oslogin = "TRUE"
    enable-osconfig = "TRUE"
    enable-guest-attributes = "TRUE"
  }
  lifecycle {
    create_before_destroy = true
  }
}