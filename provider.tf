# providers.tf
provider "google" {
  credentials = file("${gcp-sa-key}")
  project     = var.project_id
  region      = var.region
}
