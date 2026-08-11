variable "aws_region" {
  type        = string
  description = "Target AWS Region for deployment infrastructure"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 compute size flavor allocation"
  default     = "t2.micro"
}
