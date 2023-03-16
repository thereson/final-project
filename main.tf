provider "aws" {
access_key=var.access_key
secret_key=var.secret_key
region = "us-East-1a"
}

resource "aws_vpc" "myvpc" {
cidr_block = "10.0.0.0/16"
}

