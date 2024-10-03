# Define a provider
provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}

# Define a resources (VPC, Subnet, instances ...)

# 1. VPC
resource "aws_vpc" "dev-vpc" {
    cidr_block = "10.0.0.0/16"
}

# 2. Subnet
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-2a"
}

# 3. Consultamos los datos de la vpc
data "aws_vpc" "existing_vpc" {
    default = true
}

# 4. Aqui agregamos una segunda subnet dentro de la vpc
# Tenemos que cambiar el cidr_block
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "us-east-2a"
}