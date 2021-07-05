resource "google_compute_global_forwarding_rule" "app-fr" {
  provider = google-beta
  name       = "backend-global-rule"
  target     = google_compute_target_https_proxy.app-thp.id
  port_range = 443
  ip_address = google_compute_global_address.app-lb.address
}

resource "google_compute_global_forwarding_rule" "web-fr" {
  provider = google-beta
  name       = "frontend-global-rule"
  target     = google_compute_target_https_proxy.web-thp.id
  port_range = 443
  ip_address = google_compute_global_address.web-lb.address
}