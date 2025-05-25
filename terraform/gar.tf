resource "google_artifact_registry_repository" "ntx-repo" {
  location      = var.region
  repository_id = var.repo_id
  format        = var.repo_format
}

output "artifact_registry_url" {
  value = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repo_name}"
}