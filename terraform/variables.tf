variable "project_id" {
    type        = string
    description = "ID Google project"
}

variable "region" {
    type        = string
    description = "Region Google project"
    default     = "asia-southeast1"
}

variable "repo_id" {
    type        = string
    description = "repository name"
    default     = "ntx-repo"
}

variable "repo_format" {
    type        = string
    description = "docker registry"
    default     = "DOCKER"
}

variable "image_name" {
    type        = string
    description = "image name"
    default     = "ntx-image"
}

variable "image_tag" {
    type        = string
    description = "image tag"
    default     = "latest"
}