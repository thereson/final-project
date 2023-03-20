#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        ACCESS_KEY = credentials('ACCESS_KEY')
        SECRET_KEY = credentials('SECRET_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('eksctl') {
		    	sh " eksctl get clusters"
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
