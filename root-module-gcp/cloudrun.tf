resource "google_cloud_run_v2_job" "simple" {
  name         = "cloudrun-job"
  location     = "us-central1"
  launch_stage = "BETA"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }
}
