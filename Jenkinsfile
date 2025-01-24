#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "sudo terraform init"
                        sh "sudo terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "sudo aws eks update-kubeconfig --name my-eks-cluster"
                        sh "sudo kubectl apply -f nginx-deployment.yaml"
                        sh "sudo kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}
