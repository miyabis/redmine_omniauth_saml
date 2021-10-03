Redmine::OmniAuthSAML::Base.configure do |config|
  config.saml = {
    :assertion_consumer_service_url => "https://localhost/redmine/auth/saml/callback", # The redmine application hostname
    :issuer                         => "https://localhost/redmine/", # Azure Portal SAML Base SignOn 1.Basic SAML Configuration : response URL
    :idp_sso_target_url             => "https://login.microsoftonline.com/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/saml2", # Azure Portal SAML Base SignOn 4.App Setup : Login URL
    :idp_cert_fingerprint           => "certificate fingerprint", # Azure Portal SAML Base SignOn 3.SAML signing certificate : certificate fingerprint
    :signout_url                    => "",
    :idp_slo_target_url             => "https://localhost/redmine/logout", # Azure Portal SAML Base SignOn 4.App Setup : Logout URL
    :name_identifier_format         => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress",
    :name_identifier_value          => "mail", # Which redmine field is used as name_identifier_value for SAML logout
    :attribute_mapping              => {
    # How will we map attributes from SSO to redmine attributes
        :login      => 'extra raw_info http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name',
        :firstname  => 'extra raw_info http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname',
        :lastname   => 'extra raw_info http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname',
        :mail       => 'extra raw_info http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'
    }
  }

  config.on_login do |omniauth_hash, user|
    # Implement any hook you want here
  end
end
