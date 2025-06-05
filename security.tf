resource "aws_security_group" "sg-demo" {
  name        = "webserver"
  description = "allow access on ports 8080 and 22"
  vpc_id      = aws_vpc.vp1.id

  # allow access on port 8080 
  ingress {
    description      = "http proxy access"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
# allow access on port 80
    ingress {
    description      = "http proxy access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
# allow access on port 22 SSH connection
  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    env = "Dev"
  }

}