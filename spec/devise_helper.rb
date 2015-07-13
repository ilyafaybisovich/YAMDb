def log_in
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end