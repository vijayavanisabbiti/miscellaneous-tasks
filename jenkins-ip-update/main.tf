terraform {
  backend "s3" {
    bucket = "vijayavani-terraform-state"
    key = "misc/jenkins-ip-update/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "jenkins" {
  instance_id = "i-01ba56d4506f07930"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins"
  type    = "A"
  zone_id = "Z01843807JDTGXSQ26S6"
  ttl = 10
  records = [data.aws_instance.jenkins.public_ip]
}


data "aws_instance" "artifactory" {
  instance_id = "i-006d4b1e3a9084b0c"
}


resource "aws_route53_record" "artifactory" {
  name    = "artifactory"
  type    = "A"
  zone_id = "Z01843807JDTGXSQ26S6"
  ttl = 10
  records = [data.aws_instance.artifactory.public_ip]
}
