#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRETKEY = credentials('AWS_SECRET_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('cluster/terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('cluster/microservices/deploy/kubernetes') {
			sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f complete-demo.yaml"
			sh "kubectl get svc -n sock-shop"
			sh "kubectl get all -n sock-shop"
                    }
                }
            }
        }
    }
}
