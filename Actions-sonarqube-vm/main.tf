resource "aws_instance" "web" {
  ami                    = "ami-084568db4383264d4"      #change ami id for different region
  instance_type          = "t2.large"
  key_name               = "jenpipe"              #change key name as per your setup
  vpc_security_group_ids = "sg-0f507ce682162d9a1"
  user_data              = templatefile("./install.sh", {})

  tags = {
    Name = "Jenkins-SonarQube"
  }

  root_block_device {
    volume_size = 40
  }
}

