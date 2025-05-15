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
<<<<<<< Updated upstream
                sh  'terraform -v'
                sh 'printenv'            // Linux/Unix 
=======
<<<<<<< Updated upstream
                sh '''
                  terraform -v
                   printenv' // Linux/Unix
                '''
=======
                sh  'terraform -v'
                sh  'cd live/dev'
                sh  'terraform init'
                sh 'printenv'            // Linux/Unix 
>>>>>>> Stashed changes
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                  ls -lah
<<<<<<< Updated upstream
                  terraform  init
                  terraform  plan
=======
                  terraform init
=======
>>>>>>> Stashed changes
                  terraform plan
>>>>>>> Stashed changes
                '''
            }
        }
    }
}

