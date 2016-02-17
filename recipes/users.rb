# This file will create a Jenkins admin user so that the Jenkins master server is not
# accessible by just anyone.
jenkins_password_credentials 'jenkins' do
  id '04563300-2aa9-467c-a341-4180ca7af1c6'
  description 'Jenkins Admin'
  password 'jenkinsadmin'
end