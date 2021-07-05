
resource "google_compute_region_autoscaler" "app-as" {
  name   = "backend-autoscaler"
  region = var.region
  target = google_compute_region_instance_group_manager.app-igm.id
  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 60
    cpu_utilization {
      target = 0.75
    }
  }
}

resource "google_compute_region_autoscaler" "web-as" {
  name   = "frontend-autoscaler"
  region = var.region
  target = google_compute_region_instance_group_manager.web-igm.id
  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 60
    cpu_utilization {
      target = 0.75
    }
  }
}