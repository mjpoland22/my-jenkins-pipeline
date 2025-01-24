terraform {
  backend "s3" {
    bucket = "jenkins-app-kub-2024-v2-mjp222"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}
