pipeline {
    options {
    newContainerPerStage()
    disableConcurrentBuilds()
    }
    agent none
    stages {
      stage ('Build the plugin') {
        agent {
          dockerfile {
            filename 'Dockerfile'
            customWorkspace '/tmp/kibana-extra/my_kibana_plugin'
          }
        }
        steps {
          sh 'yarn kbn bootstrap'
          sh 'yarn build -k $KIBANA_VERSION'
          archiveArtifacts artifacts: 'build/*.zip', fingerprint: true
        }
      }
    }
}
