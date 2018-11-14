pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage('iRule checkout') {
            steps {
              checkout scm
            }
        }
        
        stage('F5-Terraform-init') {
            steps {
                sh  'cd /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/; /usr/local/bin/terraform init'
            }
        }
        stage('F5-Terraform-plan') {
            steps {
                sh  'cd /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/; /usr/local/bin/terraform plan'
            }
        }
        stage('F5-Node-VM-Pool-Creation') {
            steps {
                sh  'cd /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/; /usr/local/bin/terraform apply -input=false -auto-approve'
                   
}
        }
    }
}
