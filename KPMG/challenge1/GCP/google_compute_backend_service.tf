resource "google_compute_backend_service" "app-bs" {
  name        = "backend-backend-service"
  port_name   = "https"
  protocol    = "HTTPS"
  timeout_sec = 180
  backend {
    group = google_compute_region_instance_group_manager.app-igm.instance_group
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1.0
  }
  health_checks = [google_compute_health_check.app-hhc.id]
  session_affinity = "GENERATED_COOKIE"
  affinity_cookie_ttl_sec = 300
}

resource "google_compute_backend_service" "web-bs" {
  name        = "frontend-backend-service"
  port_name   = "https"
  protocol    = "HTTPS"
  timeout_sec = 180
  backend {
    group = google_compute_region_instance_group_manager.web-igm.instance_group
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1.0
  }
  health_checks = [google_compute_health_check.web-hhc.id]
  session_affinity = "GENERATED_COOKIE"
  affinity_cookie_ttl_sec = 300
}