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