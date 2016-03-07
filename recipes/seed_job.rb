#
# Cookbook Name:: cfn-jenkins-server
# Recipe:: seed_job
#
# Copyright (C) 2016 YOUR_NAME
#
# Sets up a seed job for the Jenkins server. In this case, the job is a Job DSL job that gets
# Job DSL from a location and then uses that to build all of the rest of the jobs. It should
# be the only job in the Chef recipes, and none of them should be edited outside source control.
# The result is "infrastructure as code" in even the Jenkins jobs.

seedXml = File.join(Chef::Config[:file_cache_path], 'seed-job-dsl.xml')

# This recipe creates a "Seed Job" for the Jenkins DSL job.
template seedXml do
  source 'seedJob.xml.erb'
end

# Create the jenkins job.
jenkins_job 'seed' do
  config seedXml
  action :create
end