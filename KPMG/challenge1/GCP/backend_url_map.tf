resource "google_compute_url_map" "app-um" {
  name            = "backend-url-map-target-proxy"
  description     = "a description"
  default_service = google_compute_backend_service.app-bs.id
}

resource "google_compute_url_map" "web-um" {
  name            = "frontend-url-map-target-proxy"
  description     = "a description"
  default_service = google_compute_backend_service.web-bs.id
}