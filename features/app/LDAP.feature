Feature:  LDAP Scenarios

@firefox_box
Scenario:  As an admin, I can import a user from an LDAP Directory 

Given my account is connected via the LDAP connector
When I add a user to LDAP
Then the user is added OneLogin
