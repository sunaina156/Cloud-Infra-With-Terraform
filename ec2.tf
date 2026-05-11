resource "aws_instance" "web_server" {
  ami                         = "ami-05cf1e9f73fbad2e2" # Ubuntu
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = aws_key_pair.terraform_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx

              echo "<h1>Terraform AWS Web Server </h1>" > /var/www/html/index.htmlt
              EOF

  tags = {
    Name = "web-server-instance"
  }
}