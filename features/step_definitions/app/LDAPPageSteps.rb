Given(/^my account is connected via the LDAP connector$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
  FromClientAppsPage.select_from_users_menu("Directories")

  FromDirectoriesPage = DirectoriesPage.new
  FromDirectoriesPage.select_directory_type('LDAP via Connector')
  
  ldap_server = LdapServer.new 

  FromLdapConnectorPage = LdapConnectorPage.new
  FromLdapConnectorPage.enter_directory_name(ldap_server)
  sleep 5  
end
