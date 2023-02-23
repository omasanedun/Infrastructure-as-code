provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}