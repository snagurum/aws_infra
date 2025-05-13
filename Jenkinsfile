pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Terraform Plan Initial') {
            steps {
                echo 'hello world pull request test.... branch test5 *****'

                echo "hello world CHANGE_TARGET = ${env.CHANGE_TARGET}"  
                echo "CHANGE_ID: ${env.CHANGE_ID}"
                echo "CHANGE_TARGET: ${env.CHANGE_TARGET}"
                echo "CHANGE_BRANCH: ${env.CHANGE_BRANCH}"
                sh 'printenv' // Linux/Unix

            }
        }

        stage('Terraform Plan') {
            when {
                expression {
                    return env.CHANGE_TARGET == 'main'  // fixed: added `return`
                }
            }
            steps {
                sh '''
                  ls -lah
                  terraform init
                  terraform plan
                '''
            }
        }
    }
}

