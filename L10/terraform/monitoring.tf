# CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.project_name}-dashboard"

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
            ["AWS/ECS", "CPUUtilization", "ClusterName", "lesson8", "ServiceName", "lesson8"]
          ]
          view    = "timeSeries"
          stacked = false
          region  = var.aws_region
          period  = 300
          stat    = "Average"
          title   = "CPU Utilization"
          yAxis = {
            left = {
              min = 0
            }
          }
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
            ["AWS/ECS", "MemoryUtilization", "ClusterName", "lesson8", "ServiceName", "lesson8"]
          ]
          view    = "timeSeries"
          stacked = false
          region  = var.aws_region
          period  = 300
          stat    = "Average"
          title   = "Memory Utilization"
        }
      }
    ]
  })
}