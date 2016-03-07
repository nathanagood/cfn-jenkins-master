#
# Cookbook Name:: cfn-jenkins-server
# Recipe:: add_authentication
#
# Copyright (C) 2016 YOUR_NAME
#
# This recipe will turn authentication on in Jenkins to make sure that
# only secured users can access Jenkins. If you use the users recipe, that will be an example
# admin user. However, you may consider using OAuth or LDAP authentication.

jenkins_script 'add_authentication' do
    command <<-EOH.gsub(/^ {4}/, '')
        import jenkins.model.*
        import hudson.security.*
        import hudson.security.captcha.CaptchaSupport
        def instance = Jenkins.instance
        def realm = new HudsonPrivateSecurityRealm(false, false, (CaptchaSupport)null)
        instance.securityRealm = realm
        def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
        instance.authorizationStrategy = strategy
        instance.save()
      EOH
end