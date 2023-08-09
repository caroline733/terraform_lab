provider "aws"{ # aws 라는 provider 선언입니다.
#  access_key = "자신의 Key 를 입력" # Cloud9 을 사용하면 IAM Role 을 활용하게 됩니다. 만일 Mac 사용자는 IAM 에서 발급해야 합니다.
#  secret_key = "자신의 Key 를 입력"

  region = "ap-northeast-2" # 사용할 AWS Region 을 선언합니다.
}