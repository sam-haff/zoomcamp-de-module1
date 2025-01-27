variable "credentials_file" {
  description = "Path To GCP Creds"
  default     = "./gcp/creds.json"
}

variable "project" {
  description = "Project Name"
  default     = "terra-demo-448001"
}

variable "region" {
  description = "Project Region"
  default     = "us-central1"
}
variable "zone" {
  description = "Project Zone"
  default     = "us-central1-c"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_storage_name" {
  description = "Bucket Name"
  default     = "terra-demo-448001-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Sorage Class"
  default     = "STANDARD"
}
