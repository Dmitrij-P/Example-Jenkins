FROM jenkins/jenkins:2.479.3-jdk21

USER root

# Install Docker
RUN apt update \
    && apt install -y docker.io \
    && mkdir -p /var/jenkins_home/casc_configs

# Suggested Plugins
RUN jenkins-plugin-cli --plugins \
      ant \
      apache-httpcomponents-client-4-api \
      apache-httpcomponents-client-5-api \
      asm-api \
      authentication-tokens \
      bootstrap5-api \
      bouncycastle-api \
      branch-api \
      build-timeout \
      caffeine-api \
      checks-api \
      cloud-stats \
      commons-compress-api \
      commons-lang3-api \
      commons-text-api \
      credentials-binding \
      credentials \
      dark-theme \
      display-url-api \
      docker-java-api \
      docker-commons \
      durable-task \
      echarts-api \
      eddsa-api \
      email-ext \
      cloudbees-folder \
      font-awesome-api \
      git-client \
      git \
      gson-api \
      instance-identity \
      ionicons-api \
      jackson2-api \
      jakarta-activation-api \
      jakarta-mail-api \
      jjwt-api \
      javax-activation-api \
      jaxb \
      joda-time-api \
      jquery3-api \
      json-api \
      json-path-api \
      junit \
      ldap \
      locale \
      mailer \
      matrix-auth \
      metrics \
      mina-sshd-api-common \
      okhttp-api \
      antisamy-markup-formatter \
      pam-auth \
      workflow-aggregator \
      pipeline-graph-analysis \
      pipeline-graph-view \
      workflow-api \
      workflow-basic-steps \
      pipeline-build-step \
      pipeline-model-definition \
      pipeline-model-extensions \
      pipeline-github \
      pipeline-github-lib \
      workflow-cps \
      pipeline-groovy-lib \
      pipeline-input-step \
      workflow-job \
      pipeline-milestone-step \
      pipeline-model-api \
      workflow-multibranch \
      workflow-durable-task-step \
      workflow-scm-step \
      pipeline-stage-step \
      pipeline-stage-tags-metadata \
      workflow-step-api \
      workflow-support \
      plain-credentials \
      plugin-util-api \
      prism-api \
      resource-disposer \
      scm-api \
      script-security \
      snakeyaml-api \
      ssh-slaves \
      ssh-credentials \
      structs \
      timestamper \
      token-macro \
      trilead-api \
      variant \
      ws-cleanup

# Needed Plugins
RUN jenkins-plugin-cli --plugins \
      configuration-as-code \
      docker-plugin \
      docker-workflow \
      github-oauth \
      github

# Addition Plugins
RUN jenkins-plugin-cli --plugins \
      locale
      
                                      
USER jenkins
