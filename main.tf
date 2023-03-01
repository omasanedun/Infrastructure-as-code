provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/24"
}