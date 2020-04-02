variable "name" {
  description = "The full path name of the image repository."
}

variable "enabled" {
  default     = true
  description = "If not enabled, no resources will be created."
}

variable "pull_arns" {
  default     = []
  type        = list(string)
  description = "An optional list of IAM ARNs that may pull images."
}

variable "push_arns" {
  default     = []
  type        = list(string)
  description = "An optional list of IAM ARNs that may push images and tags."
}

variable "ecr_policy" {
  default     = ""
  description = "An optional ECR policy to be applied."
}
