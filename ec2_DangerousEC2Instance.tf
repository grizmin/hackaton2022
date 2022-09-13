resource "aws_instance" "DangerousEC2Instance" {
  ami                         = "ami-05fa00d4c63e32376"
  associate_public_ip_address = "true"
  availability_zone           = "us-east-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "DangerousInstanceProfileRole"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = "0"
  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "8"
    volume_type           = "gp2"
  }

  security_groups   = ["DangerousEC2InstanceSG"]
  source_dest_check = "true"


  tags = {
    Name = "DangerousEC2Instance"
  }

  tags_all = {
    Name = "DangerousEC2Instance"
  }

  tenancy                = "default"
}

resource "aws_security_group" "sg_DangerousEC2Instance" {
  description = "launch-wizard-2 created 2022-09-13T10:32:18.762Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name   = "DangerousEC2InstanceSG"
}