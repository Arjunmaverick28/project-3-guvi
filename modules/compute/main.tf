resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  iam_instance_profile        = var.iam_instance_profile

  user_data = <<-USERDATA
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              cat > /usr/share/nginx/html/index.html <<'HTML'
              <!DOCTYPE html>
              <html>
              <head>
                <title>Project 3 - GUVI</title>
                <style>
                  body {
                    font-family: Arial, sans-serif;
                    text-align: center;
                    margin-top: 100px;
                    background: #f3f4f6;
                  }
                  h1 { color: #1d4ed8; }
                  p { font-size: 20px; }
                </style>
              </head>
              <body>
                <h1>Project 3 - GUVI</h1>
                <p>AWS Infrastructure Automated with Terraform</p>
                <p>Deployed using GitHub Actions</p>
              </body>
              </html>
              HTML
              USERDATA

  tags = {
    Name    = "${var.project_name}-web-server"
    Project = var.project_name
  }
}

resource "aws_eip" "web" {
  domain   = "vpc"
  instance = aws_instance.web.id

  tags = {
    Name    = "${var.project_name}-web-eip"
    Project = var.project_name
  }
}
