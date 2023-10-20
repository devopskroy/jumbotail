variable "cluster_name" {
  description = " Kubernetes cluster Name"
  default = "Myk8sCluster"
}

variable "node_instance_type" {
  description = "Instance type for worker nodes"
  default     = "t2.micro"
}

variable "min_nodes" {
  description = "Minimum number of worker nodes"
  default     = 2
}

variable "max_nodes" {
  description = "Maximum number of worker nodes"
  default     = 6
}

variable "desired_nodes" {
  description = "Desired number of worker nodes"
  default     = 3
}
