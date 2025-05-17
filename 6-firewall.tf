
#6-firewall.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.cwglobal.name
  #direction = "INGRESS"

  allow {
    protocol      = "tcp"
    ports         = ["22"] # SSH
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}

resource "google_compute_firewall" "allow-database" {
  name    = "allow-database"
  network = google_compute_network.dankem.name
  #direction = "INGRESS"

  allow {
    protocol      = "tcp"
    ports         = ["3306", "1521"] # MySQL and Oracle
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}

resource "google_compute_firewall" "allow-rdp" {
  name    = "allow-rdp-dankem-with-oil"
  network = google_compute_network.dankem.name
  #direction = "INGRESS"

  allow {
    protocol      = "tcp"
    ports         = ["3389"] # RDP
  }

  
source_ranges = ["12.35.200.1/32"] #only this IP
}

resource "google_compute_firewall" "allow-proxy" {
  name    = "allow-dankem-proxy"
  network = google_compute_network.dankem.name
  #direction = "INGRESS"

  allow {
    protocol      = "tcp"
    ports         = ["8080"] #local host
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}

resource "google_compute_firewall" "allow-dns" {
  name    = "allow-dank-dns"
  network = google_compute_network.dankem.name
  #direction = "INGRESS"

  allow {
    protocol      = "tcp"
    ports         = ["53"] # DNS
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}

resource "google_compute_firewall" "allow-dns-udp" {
  name    = "allow-lizzo-dns"
  network = google_compute_network.dankem.name
  #direction = "INGRESS"

  allow {
    protocol      = "udp"
    ports         = ["53"] # DNS
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}

resource "google_compute_firewall" "allow-ping" {
  name    = "allow-dank-ping"
  network = google_compute_network.dankem.name
  #direction = "INGRESS"

  allow {
    protocol      = "icmp" # ICMP
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}

resource "google_compute_firewall" "allow-ping2" {
  name    = "allow-lizzo-ping"
  network = google_compute_network.cwglobal.name
  #direction = "INGRESS"

  allow {
    protocol      = "icmp" # ICMP
  }

  
source_ranges = ["0.0.0.0/0"] #all traffic
}