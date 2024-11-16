# providers.tf
provider "google" {
  credentials = file("<path_to_your_service_account_key>")
  project     = var.project_id
  region      = var.region
}
