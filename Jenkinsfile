pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Terraform Plan') {
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
