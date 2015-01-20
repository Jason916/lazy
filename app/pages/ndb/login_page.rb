require File.expand_path 'app/cases/shared/action'
class LoginPage < Lol::Page
	include Action

	page_url "#{$config.host}user/user/login"

  text_field 'username', id: 'LoginForm_username'
  text_field 'password', id: 'LoginForm_password'
  button 'login_btn', name: 'yt0'

  def login user,password
      self.username = user
      self.password = password
      self.login_btn

    turn_to HomePage
  end 
end

