terraform {
    backend "gcs" { 
      bucket  = "ntx-gcp-terraform-state"
      prefix  = "feature"
    }
}

provider "google" {
  project = var.project
  region = var.region
}