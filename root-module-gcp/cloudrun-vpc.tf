resource "google_cloud_run_v2_job" "default" {
  name         = "cloudrun-job"
  location     = "us-central1"
  launch_stage = "BETA"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
      vpc_access {
        connector = google_vpc_access_connector.connector.id
        egress    = "ALL_TRAFFIC"
      }
    }
  }
}

resource "google_vpc_access_connector" "connector" {
  name = "run-vpc"
  subnet {
    name = google_compute_subnetwork.custom_test.name
  }
  machine_type  = "e2-standard-4"
  min_instances = 2
  max_instances = 3
  region        = "us-central1"
  labels {
    env = "Dev"
  }

}
resource "google_compute_subnetwork" "custom_test" {
  name          = "run-subnetwork"
  ip_cidr_range = "10.2.0.0/28"
  region        = "us-central1"
  network       = google_compute_network.custom_test.id
  labels {
    env = "Dev"
  }
}
resource "google_compute_network" "custom_test" {
  name                    = "run-network"
  auto_create_subnetworks = false
  labels {
    env = "Dev"
  }
}
