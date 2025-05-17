#3-subnets.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "private" {
  name                     = "private"
  ip_cidr_range            = "10.0.0.0/16"
  region                   = "us-central1"
  network                  = google_compute_network.cwglobal.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "cwsubnet-1"
    ip_cidr_range = "10.42.0.0/24"
  }

   secondary_ip_range {
    range_name    = "cwsubnet-2"
    ip_cidr_range = "10.52.0.0/24"
  }
}
resource "google_compute_subnetwork" "private2" {
  name                     = "private2"
  ip_cidr_range            = "10.0.0.0/16"
  region                   = "southamerica-east1"
  network                  = google_compute_network.dankem.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "cwsubnet-3"
    ip_cidr_range = "10.62.0.0/24"
  }

   secondary_ip_range {
    range_name    = "cwsubnet-4"
    ip_cidr_range = "10.72.0.0/24"
  }
}


  