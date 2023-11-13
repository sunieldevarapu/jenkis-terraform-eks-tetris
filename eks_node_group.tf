resource "aws_instance" "kubectl-server" {
  ami                         = "ami-0261755bbcb8c4a84"
  key_name                    = "pklcloudshare"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-1.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  tags = {
    name = "kubectl"
  }
}

resource "aws_eks_node_group" "node_grp" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "pc-node-grp"
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [aws_subnet.public-1.id, aws_subnet.public-2.id]
  capacity_type   = "ON_DEMAND"
  disk_size       = "20"
  instance_types  = ["t2.small"]
  remote_access {
    ec2_ssh_key               = "pklcloudshare"
    source_security_group_ids = [aws_security_group.allow_tls.id]
  }
  labels = tomap({ env = "dev" })
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.EC2InstanceProfileForImageBuilderECRContainerBuilds,
  aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly]

}