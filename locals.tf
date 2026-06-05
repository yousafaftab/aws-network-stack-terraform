locals {
  name = "network-stack-${var.username}"
  tags = {
    Name  = local.name
    Owner = var.username
  }

  ec2_user_data = base64encode(<<-EOF
    #!/bin/bash
    yum install -y nginx
    service nginx start
  EOF
  )
}
