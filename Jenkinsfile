#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_KEY = credentials('AWS_SECRET_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('eksctl') {
                        sh "eksctl create cluster -n cluster1 --nodegroup-name ng1 --region us-east-1 --node-type t2.micro --nodes 2"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('eksctl') {
			sh "kubectl create namespace sock-shop"
                        sh "kubectl apply -f complete-demo.yaml"
			sh "kubectl get svc -n sock-shop"
			sh "kubectl get all -n sock-shop"
                    }
                }
            }
        }
    }
}
