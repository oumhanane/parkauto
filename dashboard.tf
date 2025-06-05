resource "aws_cloudwatch_dashboard" "parkauto_dashboard" {
  dashboard_name = "ParkAutoDashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/EKS", "CPUUtilization", "ClusterName", var.eks_cluster_name ]
          ]
          period = 300
          stat   = "Average"
          region = "eu-west-3"
          title  = "CPU Utilization"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/EKS", "MemoryUtilization", "ClusterName", var.eks_cluster_name ]
          ]
          period = 300
          stat   = "Average"
          region = "eu-west-3"
          title  = "Memory Utilization"
        }
      }
    ]
  })
}
