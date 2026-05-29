output "main_alb" {
  description = "main alb"
  value = aws_lb.main_alb.arn
}
output "alb_target_group" {
  description = "target group"
  value = aws_lb_target_group.alb_target_group.arn
}