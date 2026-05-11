resource "aws_instance" "web_server" {
  ami                         = "ami-0a59ec92177ec3fad" # Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = aws_key_pair.terraform_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx

              echo "<h1>Terraform AWS Web Server </h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "web-server-instance"
  }
}