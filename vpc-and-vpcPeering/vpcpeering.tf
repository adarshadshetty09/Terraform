# provider "aws" {
#   region = "ap-south-1"
# }

#######################
# VPC 1 Configuration
#######################

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "VPC-1"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

resource "aws_subnet" "vpc1_subnet" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name        = "VPC1-Subnet"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

resource "aws_route_table" "vpc1_rt" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name        = "VPC1-RouteTable"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

resource "aws_route_table_association" "vpc1_assoc" {
  subnet_id      = aws_subnet.vpc1_subnet.id
  route_table_id = aws_route_table.vpc1_rt.id
}

#######################
# VPC 2 Configuration
#######################

resource "aws_vpc" "vpc2" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name        = "VPC-2"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

resource "aws_subnet" "vpc2_subnet" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name        = "VPC2-Subnet"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

resource "aws_route_table" "vpc2_rt" {
  vpc_id = aws_vpc.vpc2.id
  tags = {
    Name        = "VPC2-RouteTable"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

resource "aws_route_table_association" "vpc2_assoc" {
  subnet_id      = aws_subnet.vpc2_subnet.id
  route_table_id = aws_route_table.vpc2_rt.id
}

##########################
# VPC Peering Connection
##########################

resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.vpc1.id
  peer_vpc_id   = aws_vpc.vpc2.id
  auto_accept   = true

  tags = {
    Name        = "vpc1-to-vpc2"
    Environment = "dev"
    Project     = "vpc-peering"
  }
}

##########################
# Routing Between VPCs
##########################

resource "aws_route" "vpc1_to_vpc2" {
  route_table_id            = aws_route_table.vpc1_rt.id
  destination_cidr_block    = aws_vpc.vpc2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "vpc2_to_vpc1" {
  route_table_id            = aws_route_table.vpc2_rt.id
  destination_cidr_block    = aws_vpc.vpc1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
