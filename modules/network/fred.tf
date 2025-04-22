variable "prefix" {
    type = string
}
variable "vpc_cidr_block" {
    type = string
}
variable "subnet_cidr_block" {
    type = string
}
 
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = join("-", ["vpc", var.prefix])
    }
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags ={
        Name = join("-", ["subnet", var.prefix])
    }
}