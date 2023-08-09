provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_key_pair" "key-pair" {
  key_name = "tf-kjw"
  public_key = file("/home/ec2-user/.ssh/tf-kjw.pub")
}