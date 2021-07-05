resource "google_compute_health_check" "app-hhc" {
  name               = "backend-check-backend"
  timeout_sec        = 1
  check_interval_sec = 1
  https_health_check {
    port = "443"
    request_path = "/"
  }
}

resource "google_compute_health_check" "web-hhc" {
  name               = "frontend-check-backend"
  timeout_sec        = 1
  check_interval_sec = 1
  https_health_check {
    port = "443"
    request_path = "/"
  }
}