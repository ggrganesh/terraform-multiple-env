resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f" # this is our devops practice AMI Id 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = lookup(var.instance_type, terraform.workspace)

  tags = {

    Name     = "demo-${terraform.workspace}"
    Purspose = "terraform-first"
  }

}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls-${terraform.workspace}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
