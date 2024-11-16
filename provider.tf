# providers.tf
provider "google" {
  credentials = file("gcp_devops.json")
  project     = var.project_id
  region      = var.region
}
