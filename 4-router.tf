#4-router.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  name    = "router"
  region  = "us-central1"
  network = google_compute_network.cwglobal.id
}

resource "google_compute_router" "router2" {
  name    = "router2"
  region  = "southamerica-east1"
  network = google_compute_network.dankem.id
}