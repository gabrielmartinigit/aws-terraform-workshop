variable "app_name" {
  description = "app name utilized as bucket name and cloudfront distribution"
  default     = ""
}

variable "environment" {
  description = "workload environment"
  default     = "dev"
}
