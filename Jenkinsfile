@Library('linkurious-shared')_

dockerJob {
  // General
  projectName = "linkurious/docker-curl-jq"
  podTemplateNames = ['jnlp-agent']
  buildkitBuilder = true

  //buildOnlyAfterUpload = true
  runDependencyScan = true

  createGitTag = true
  runBookeeping = true
  githubRelease = true
}
