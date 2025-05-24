terraform {
    backend "gcs" { 
      bucket  = "ntx-gcp-terraform-state"
      prefix  = "feature"
    }
}

provider "google" {
  project = var.project_id
  region = var.region
}