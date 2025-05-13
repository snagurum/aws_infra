pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Terraform Plan') {
            steps{
                echo 'hello world '
                echo 'hello world pull request test.... branch test4   *****'
                echo 'hello world ${env.CHANGE_TARGET}'
            }
            when {
                expression {
                    env.CHANGE_TARGET == 'main'
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
