resource "google_artifact_registry_repository" "ntx-repo" {
  location      = var.region
  repository_id = var.repo_id
  format        = var.repo_format
}

data "google_artifact_registry_docker_image" "ntx-img-app" {
  location      = google_artifact_registry_repository.ntx-repo.location
  repository_id = google_artifact_registry_repository.ntx-repo.repository_id
  image_name    = "${var.image_name}:${var.image_tag}"
}
