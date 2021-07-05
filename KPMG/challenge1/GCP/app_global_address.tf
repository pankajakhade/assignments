resource "google_compute_global_address" "app-lb" {
  name = "backend-lb-ip"
}

resource "google_compute_global_address" "web-lb" {
  name = "frontend-lb-ip"
}

