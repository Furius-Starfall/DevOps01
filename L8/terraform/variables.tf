variable "aws_region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

variable "project_name" {
    default = "ecs-nginx-demo"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
  default     = "103549976630"
}