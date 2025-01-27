provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
  credentials = file(var.credentials_file)
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_storage_name
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "demo-dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}