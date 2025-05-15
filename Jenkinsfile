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
                sh  'cd live/dev'
                sh  'terraform init'
                sh 'printenv'            // Linux/Unix 

            }
        }


        stage('Terraform Plan (on PR only)') {
            when {
                expression {
                    return env.BRANCH_NAME == "PR-${env.CHANGE_ID}-head" && env.CHANGE_TARGET == 'main'
                }
            }
            steps {
                sh '''
                  cd live/dev
                  terraform plan
                '''
            }
        }
    }
}

