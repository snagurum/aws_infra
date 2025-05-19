pipeline {
    agent any
    tools {
       terraform 'terraform-1.11.4'
    }

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Terraform Plan Initial') {
            steps {
                echo "CHANGE_ID: ${env.CHANGE_ID}, CHANGE_TARGET: ${env.CHANGE_TARGET}, CHANGE_BRANCH: ${env.CHANGE_BRANCH}"
                sh  'terraform -v'
                sh 'printenv'            // Linux/Unix 
            }
        }

        stage('Terraform Plan') {
            when {
                expression {
                        //return env.CHANGE_TARGET == 'main'
                        branch pattern: "PR-\\d+-head", comparator: "REGEXP"
                }
            }
            steps {
                sh '''
                  cd live/dev
                  ls -lah
                  terraform  init
                  terraform  plan
                '''
            }
        }

        stage('Terraform Apply on Develop') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    cd live/dev
                    terraform  init
                    terraform plan
                    terraform apply -auto-approve
                '''
            }
        }
    }
}

