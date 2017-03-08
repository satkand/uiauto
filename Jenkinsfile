#!groovy

def bash(command) {
  sh """#!/bin/bash -l
  ${command}
  """
}

def publishReports() {
  cobertura(autoUpdateHealth: false, autoUpdateStability: false, classCoverageTargets: '100, 99.99, 99.99', coberturaReportFile: 'reports/cobertura.xml', conditionalCoverageTargets: '100, 99.99, 99.99', failUnhealthy: false, failUnstable: false, fileCoverageTargets: '100, 99.99, 99.99', lineCoverageTargets: '100, 99.99, 99.99', maxNumberOfBuilds: 0, methodCoverageTargets: '100, 99.99, 99.99', onlyStable: false, packageCoverageTargets: '100, 99.99, 99.99', sourceEncoding: 'ASCII')
  junit 'reports/test.xml'
}

pipeline {

  agent any

  options { ansiColor('xterm') }

  stages {

    stage('Dependencies Setup') {

      steps { bash "bundler install --local --path vendor/bundle" }
    }

    stage('Pull Request Validations') {

      when { changeRequest() }

      steps { bash "bundler exec fastlane ci_dev" }

      post { success { publishReports() } }
    }

    stage('On branch develop') {

      when { branch 'develop' }

      stages {
      
        stage('Dev Job') {

          steps { bash "bundler exec fastlane ci_dev" }

          post { success { publishReports() } }
        }

        stage('QA Job') {

          steps { bash "bundler exec fastlane ci_qa" }
        }
      }
    }

    stage('Release Job') {

      when { branch 'master' }

      steps { bash "bundler exec fastlane ci_drop" }
    }
  }
}
