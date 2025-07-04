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
                 script{
                        echo "************************** Terraform Plan **************************"
                        def terraformPlanOutput = sh(script: '''
                                cd live/dev
                                terraform init
                                terraform plan  -no-color
                                ''', returnStdout: true).trim()
                        echo "Terraform plan Output:\n${terraformPlanOutput}"
                 }       
            }
        }

        stage('Terraform Apply on Develop') {
            when {
                branch 'main'
            }
            steps {
//                sh '''
//                    cd live/dev
//                    terraform  init
//                    terraform plan
//                    terraform apply -auto-approve
//                '''
                 script{
                        echo "************************** Terraform Plan **************************"
                        def terraformPlanOutput = sh(script: '''
                                cd live/dev
                                terraform init
                                terraform plan  -no-color
                                ''', returnStdout: true).trim()
                        echo "Terraform plan Output:\n${terraformPlanOutput}"
                        echo "************************** Terraform Apply **************************"
                        def terraformApplyOutput = sh(script: '''
                                cd live/dev
                                terraform apply -auto-approve  -no-color
                                ''', returnStdout: true).trim()
                        echo "Terraform Apply Output:\n${terraformApplyOutput}"
                
                }
           }
      }
   }   
}

