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
            }
        }
        
        stage('init') {
            steps {
                sh  """
                    /usr/local/bin/terraform init /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/ -backend=true -input=false
                    """
            }
        }
        stage('plan') {
            steps {
                sh  """
                    /usr/local/bin/terraform plan /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/ -out=tfplan -input=false 
                    """
            }
        }
        stage('apply') {
            steps {
                sh  """
                     /usr/local/bin/terraform apply /Users/naveen/go/src/github.com/f5devcentral/terraform-provider-bigip/ -lock=false -input=false tfplan
                    """
}
        }
    }
}
