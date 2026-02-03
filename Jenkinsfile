pipeline {
    agent any

    environment {
        PYTHON_VERSION = '3.8'
    }

    stages {
        stage('Setup') {
            steps {
                sh '''
                    python3 -m venv cov_env
                    . cov_env/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    . cov_env/bin/activate
                    pytest -v --junitxml=test-results.xml
                '''
            }
            post {
                always {
                    junit 'test-results.xml'
                }
            }
        }

        stage('Coverage') {
            steps {
                sh '''
                    . cov_env/bin/activate
                    pytest --cov=src \
                           --cov-report=html:coverage_html \
                           --cov-report=xml:coverage.xml \
                           --cov-report=term-missing
                '''
            }
            post {
                always {
                    publishHTML(target: [
                        reportDir: 'coverage_html',
                        reportFiles: 'index.html',
                        reportName: 'Coverage Report'
                    ])
                    cobertura coberturaReportFile: 'coverage.xml'
                }
            }
        }

        stage('Coverage Threshold Check') {
            steps {
                sh '''
                    . cov_env/bin/activate
                    coverage report --fail-under=80
                '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Tests passed and coverage meets threshold!'
        }
        failure {
            echo 'Tests failed or coverage below threshold!'
        }
    }
}
