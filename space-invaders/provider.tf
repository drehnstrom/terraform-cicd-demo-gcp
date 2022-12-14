terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
  backend "gcs" {
    bucket  = "doug-rehnstrom-tfstate"
    prefix  = "cicd-demo/state"
  }
}

provider "google" {
  
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
