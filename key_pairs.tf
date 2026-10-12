
resource "aws_key_pair" "devops_key" {
  key_name   = var.aws_ec2_key_pair_name
  public_key = var.aws_ec2_key_pair_public_key
}
