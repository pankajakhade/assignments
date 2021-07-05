
data "google_compute_ssl_certificate" "my_cert" {
  name = "certificate"  ## Create this certificate first either google managed cert or self managed cert.
  project = var.projectId
}

