resource "google_compute_target_https_proxy" "app-thp" {
  name       = "backend-target-proxy"
  url_map          = google_compute_url_map.app-um.id
  ssl_certificates = [data.google_compute_ssl_certificate.my_cert.id]
}

resource "google_compute_target_https_proxy" "web-thp" {
  name       = "frontend-target-proxy"
  url_map          = google_compute_url_map.web-um.id
  ssl_certificates = [data.google_compute_ssl_certificate.my_cert.id]
}
