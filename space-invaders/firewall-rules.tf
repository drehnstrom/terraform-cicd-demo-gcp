# allow http
resource "google_compute_firewall" "allow-http" {
  count   = var.instance_count > 0 ? 1 : 0
  name    = "${var.project_name}-allow-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
  target_tags = ["webserver"] 

}
