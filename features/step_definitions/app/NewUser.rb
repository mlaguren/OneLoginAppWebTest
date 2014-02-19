Given(/^I am on the new user page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users

  FromUsersPage = UsersPage.new
  FromUsersPage.select_new_user

end


When(/^I create and invite the new user$/) do
  new_user=User.new
  new_user.save_to_file(new_user,"#{$new_user_file}") 

  FromNewUserPage = NewUserPage.new
  FromNewUserPage.enter_basic_user(new_user)
  FromNewUserPage.click_save
  
  FromEditUserPage = EditUserPage.new
  FromEditUserPage.select_send_invitation_from_more_actions_menu

  invite = SendInvitation.new
  invite.verify_users_email(new_user.email)
  invite.send_invite
#  invite.close_popup
end

Then(/^the new user receives the OneLogin invite$/) do

  #Get Email Address
  EmailInvite = JSON.parse(IO.read('logfiles/users/new_user.json'))
  p EmailInvite["email"] 
  mailbox = MailboxApi.new('38a1661e','861546f72e95d37')
  emails = mailbox.getEmailsByRecipient(EmailInvite["email"])
  p emails
  while emails.empty? do
    emails = mailbox.getEmailsByRecipient(EmailInvite["email"])
  end
  p emails[0].subject
  subject = emails[0].subject
  subject.should == "Invitation to OneLogin from SQA Essentials"
  link = emails[0].text.links[8].text
  invite = IMGKit.new(emails[0].html, :quality => 50)
  img = invite.to_img
  file = img.to_file('email.jpg')
end

When(/^I import users$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the users are created$/) do
  pending # express the regexp above with the code you wish you had
end

