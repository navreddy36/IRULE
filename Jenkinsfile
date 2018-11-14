pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage('checkout repo') {
            steps {
              checkout scm
              sh 'git pull origin master'
            }
        }
        
        stage('init') {
            steps {
                sh  'cd /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/; /usr/local/bin/terraform init'
            }
        }
        stage('plan') {
            steps {
                sh  'cd /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/; /usr/local/bin/terraform plan'
            }
        }
        stage('apply') {
            steps {
                sh  'cd /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/; /usr/local/bin/terraform apply -input=false -auto-approve'
                   
}
        }
    }
}
