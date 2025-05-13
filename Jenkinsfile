pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Terraform Plan Initial') {
            steps {
                echo 'hello world'
                echo 'hello world pull request test.... branch test5 *****'
                echo "hello world CHANGE_TARGET = ${env.CHANGE_TARGET}"  // fixed syntax
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
                  terraform init
                  terraform plan
                '''
            }
        }
    }
}

