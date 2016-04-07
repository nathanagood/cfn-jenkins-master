#
# Cookbook Name:: cfn-jenkins-server
# Recipe:: plugins
#
# Copyright (C) 2016 YOUR_NAME
#
# Installs a group of suggested plugins given certain profiles.

# This one is always installed.
jenkins_plugin 'job-dsl'

# Install git and some useful deps for git.
if node['jenkins_master']['plugin_profiles'].include? 'git'
  jenkins_plugin 'git'
  jenkins_plugin 'scm-api'
  jenkins_plugin 'git-client'
  jenkins_plugin 'matrix-project'
  jenkins_plugin 'credentials'
  jenkins_plugin 'mailer'
  jenkins_plugin 'ssh-credentials'
end

# Install some plugins useful for Java unit testing and static code analysis
if node['jenkins_master']['plugin_profiles'].include? 'java'
  jenkins_plugin 'junit' do
    version '1.11'
  end
  jenkins_plugin 'pmd'
  jenkins_plugin 'cobertura'
  jenkins_plugin 'gradle'
  jenkins_plugin 'findbugs'
  jenkins_plugin 'test-stability'
  jenkins_plugin 'jacoco'
end

# Install plugins that are useful for development in an AWS ecosystem.
if node['jenkins_master']['plugin_profiles'].include? 'aws'
  jenkins_plugin 'jenkins-cloudformation-plugin'
  jenkins_plugin 's3'
  jenkins_plugin 'codedeploy'
  jenkins_plugin 'aws-codepipeline'
end

# Restart Jenkins to because some of the plugins require a restart after installation
# (although that is supposed to not be the case in newer plugins)
jenkins_command 'safe-restart'