resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "terra-eks-route"
  }
}

resource "aws_route_table_association" "as-1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "as-2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.rtb.id
}