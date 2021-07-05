resource "google_compute_firewall" "tomcat_enable_health_check_rule" {
  name    = "service-healthcheck-rule"
  network = module.network.network_name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = concat(var.networkTagsApp, var.networkTagsWeb)
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}