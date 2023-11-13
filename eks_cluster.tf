resource "aws_eks_cluster" "eks" {
  name     = "pc-eks"
  role_arn = aws_iam_role.master.arn
  vpc_config {
    subnet_ids = [aws_subnet.public-1.id, aws_subnet.public-2.id]
  }
  depends_on = [aws_iam_role.master,
  aws_subnet.public-1, aws_subnet.public-2]
}