pipeline {
    // Run pipeline on an agent with Docker capability for environment isolation
    agent {
        label 'docker-maven-chrome'
    }

    // Set dynamic parameters available for manual pipeline trigger executions
    parameters {
        choice(name: 'BROWSER', choices: ['Chrome_Headless', 'Firefox_Headless', 'RemoteGrid'], description: 'Select the target test execution environment')
        choice(name: 'ENVIRONMENT', choices: ['QA', 'Staging', 'Production'], description: 'Target deployment environment to run tests against')
        string(name: 'TEST_SUITE', defaultValue: 'testng-smoke.xml', description: 'Enter target testng XML configuration suite file')
    }

    // Configure pipeline run behavior options
    options {
        timeout(time: 30, unit: 'MINUTES') // Failsafe timeout to prevent hung driver sessions
        disableConcurrentBuilds()         // Prevent resource bottlenecks on grid agent nodes
        ansiColor('xterm')                 // Enable color logging inside console outputs
    }

    // Inject sensitive properties as environment variables safely at runtime
    environment {
        SELENIUM_GRID_URL = 'http://localhost:4444/wd/hub'
        GRID_CREDENTIALS  = credentials('grid-auth-credentials') // Jenkins secure credentials binder
    }

    stages {
        stage('Initialize Framework') {
            steps {
                echo '=== INITIALIZING AUTOMATION PIPELINE RUN ==='
                echo "Running on Agent: ${env.NODE_NAME}"
                echo "Executing Test Suite: ${params.TEST_SUITE} on Environment: ${params.ENVIRONMENT}"
                
                // Print tool versions inside workspace to detect configuration drift
                sh 'mvn -version'
                sh 'git --version'
            }
        }

        stage('Checkout Repository') {
            steps {
                echo '=== FETCHING SOURCE CODE FROM VERSION CONTROL ==='
                // Pulls project from git using checked out environment settings
                checkout scm
            }
        }

        stage('Compile & Lint') {
            steps {
                echo '=== COMPILING SOURCE CODE AND CHECKING DEPENDENCIES ==='
                // Compile files without executing tests to detect structural or syntax failures early
                sh 'mvn clean compile -f builds-script/pom.xml'
            }
        }

        stage('Execute Automated Regression') {
            steps {
                echo "=== INITIATING AUTOMATED TESTS ON BROWSER: ${params.BROWSER} ==="
                // Wrap test execution inside catchError to guarantee that downstream reporting runs even on failure
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh """
                        mvn test -f builds-script/pom.xml \
                        -Dbrowser=${params.BROWSER} \
                        -Denv=${params.ENVIRONMENT} \
                        -DsuiteXmlFile=${params.TEST_SUITE} \
                        -Dselenium.grid.url=${env.SELENIUM_GRID_URL}
                    """
                }
            }
        }

        stage('Process Test Reports') {
            steps {
                echo '=== GENERATING VERIFICATION REPORT DASHBOARDS ==='
                // Compile Surefire and Allure interactive dashboard reports
                sh 'mvn allure:report -f builds-script/pom.xml'
            }
        }
    }

    // Execute post-build hooks to archive artifacts and dispatch alerts
    post {
        always {
            echo '=== PERFORMING PIPELINE CLEANUP AND REPORT ARCHIVING ==='
            
            // 1. Archive Maven Surefire and Allure XML/JSON reports as build artifacts
            archiveArtifacts artifacts: '**/target/surefire-reports/*.*, **/target/allure-results/*.*', allowEmptyArchive: true
            
            // 2. Publish JUnit XML files directly to the Jenkins Build Panel UI
            junit testResults: '**/target/surefire-reports/*.xml', allowEmptyResults: true
            
            // 3. Clear workspace to prevent disk volume exhaustion on agent nodes
            cleanWs()
        }
        success {
            echo '=== PIPELINE PASSED SUCCESSFULLY ==='
            // Trigger Slack channel webhook to alert development team
            slackSend channel: '#qa-ci-alerts', 
                      color: '#00FF00', 
                      message: "SUCCESS: Job '${env.JOB_NAME}' [Build #${env.BUILD_NUMBER}] completed successfully! Details: ${env.BUILD_URL}"
        }
        failure {
            echo '=== PIPELINE ENCOUNTERED ERRORS ==='
            // Alerts on compile failures, syntax problems, or failed functional assertions
            slackSend channel: '#qa-ci-alerts', 
                      color: '#FF0000', 
                      message: "FAILURE: Job '${env.JOB_NAME}' [Build #${env.BUILD_NUMBER}] failed quality gates. Review logs and artifacts at: ${env.BUILD_URL}"
        }
    }
}