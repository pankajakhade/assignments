
resource "google_compute_region_instance_group_manager" "app-igm" {
  provider = google-beta
  region   = var.region
  name     = "backend-igm"
  version {
    instance_template = google_compute_instance_template.app-template.id
    name              = "primary"
  }
  base_instance_name = "backend"
  #target_size        = 1
  target_size        = null
  named_port {
    name = "https"
    port = 8443
  }
}
resource "google_compute_region_instance_group_manager" "web-igm" {
  provider = google-beta
  region   = var.region
  name     = "frontend-igm"
  version {
    instance_template = google_compute_instance_template.web-template.id
    name              = "primary"
  }
  base_instance_name = "frontend"
  #target_size        = 1
  target_size        = null
  named_port {
    name = "https"
    port = 8443
  }
}