#
# Cookbook Name:: cfn-jenkins-server
# Recipe:: backup_restore
#
# Copyright (C) 2016 YOUR_NAME
#
# This recipe will create a mechanism to backup restore the Jenkins master, but only if a certain lock file
# does not exist. The lock file will be created by a cron job.

# Create a cron file in the /etc/cron.hourly directory to do the backup.
template '/etc/cron.hourly/backupJenkinsToS3' do
  source 'backupJenkinsToS3.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

# Try to download a backup, if it's there. If it is found and can be installed, then execute
# a script to unpack the archive.
remote_file '/tmp/jenkins-workspace.tgz' do
  source 'http://s3.url'
  owner 'root'
  group 'root'
  mode '0644'
  ignore_failure true
  notifies :run, 'execute[restoreFromS3]', :immediately
  not_if ''
end

# If the file was downloaded successfully, then extract the file into the Jenkins jobs directory.
execute 'restoreFromS3' do
  command 'tar -C /var/lib/jenkins/jobs -xzvf /tmp/jenkins-workspace.tgz'
  creates '/var/'
  action :nothing
end

