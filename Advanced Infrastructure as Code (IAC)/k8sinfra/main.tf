resource "aws_s3_bucket" "eks_cluster_backup" {
  bucket = "eks-cluster-backup-bucket" # Choose a unique name
  acl    = "private" 
}
resource "aws_cloudwatch_log_group" "eks_cluster_logs" {
  name              = "eks-cluster-logs"
  retention_in_days = 7 
} 

resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = ["api", "audit"]
  
  cloudwatch_log_group {
    name = aws_cloudwatch_log_group.eks_cluster_logs.name
  }
  vpc_config {
    subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
  }

}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-worker-nodes"

  node_group_status = "ACTIVE"

  node_role_arn = aws_iam_role.eks_node_group_role.arn
  subnet_ids   = aws_subnet.example[*].id
  instance_types = [var.node_instance_type]

  scaling_config {
    min_size = var.min_nodes
    desired_size = var.desired_nodes
    max_size = var.max_nodes
  }

  
}


resource "null_resource" "restore_eks_cluster" {
  triggers = {
    cluster_name     = aws_eks_cluster.my_eks_cluster.name
    bucket_name      = aws_s3_bucket.eks_cluster_backup.bucket
    bucket_prefix    = "backup"
  }

  provisioner "local-exec" {
    command = <<EOT
      aws eks update-cluster-config --name ${aws_eks_cluster.my_eks_cluster.name} --resources-vpc-config subnetIds="${join(",", module.vpc.private_subnets)}"
    EOT
  }
}


