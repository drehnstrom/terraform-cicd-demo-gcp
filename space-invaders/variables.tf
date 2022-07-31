variable "project_id" {
  description = "The GCP Project ID."
  type        = string
}

variable "instance_count" {
  type    = number
  default = 0
}

variable "project_name" {
  description = "The Name of the Program you are deploying."
  type        = string
  default     = "space-invaders"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "image_id" {
  description = "The id of the machine image (AMI) to use for the server."
  type        = string
  default     = "debian-cloud/debian-9"
}

variable "machine_type" {
  description = "The size of the VM instances."
  type        = string
  default     = "f1-micro"
}

variable "preemptible" {
  type    = bool
  default = true
}
