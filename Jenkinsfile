@Library([
  'ableton-utils@0.11',
  'groovylint@0.4',
]) _

import com.ableton.BuildMatrix as BuildMatrix


void addCheckoutStage(String nextStageName) {
  eager.timedStage("Checkout for ${nextStageName}") {
    sh 'env' // Print out all environment variables for debugging purposes
    checkout scm
  }
}


void addCheckStages() {
  eager.timedStage('Check') {
    eager.timedNode('generic-linux') {
      addCheckoutStage('Check')
      parallel(failFast: false,
        groovylint: {
          groovylint.check('./Jenkinsfile')
        },
      )
    }
  }
}


void addConfigureStage(Map args) {
  dir('build') {
    eager.timedStage('Configure') {
      sh "cmake -G ${args.generator} .."
    }
  }
}


void addBuildStage(Map args) {
  eager.timedStage('Build') {
    dir('build') {
      sh "cmake --build . --config ${args.configuration}"
    }
  }
}


void addTestStage(Map args) {
  eager.timedStage('Test') {
    dir('build') {
      sh "ctest -C ${args.configuration} . -V"
    }
  }
}


void addBuildStages(Map args) {
  eager.timedNode("generic-${args.platform}-${args.compiler}") {
    addCheckoutStage('Build')
    addConfigureStage(args)
    addBuildStage(args)
    addTestStage(args)
  }
}


try {
  runTheBuilds.report('pending', env.CALLBACK_URL)
  addCheckStages()

  BuildMatrix matrix = buildMatrix.create(
    branchNameKeys: ['platform', 'compiler', 'configuration'],
  )
  .add(platform: 'mac',
    compiler: ['xcode7.3.1', 'xcode8.3.3', 'xcode9.3'],
    configuration: ['Debug', 'Release'],
    generator: 'Xcode',
  )
  matrix.withParallel { args ->
    addBuildStages(args)
  }
}
catch (error) {
  runTheBuilds.report('failure', env.CALLBACK_URL)
  throw error
}

runTheBuilds.report('success', env.CALLBACK_URL)
