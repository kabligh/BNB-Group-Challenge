feature 'Sign up' do
  scenario 'As a user, I want to sign-up for BNB makers' do
    visit '/'
    fill_in 'name', with: 'Tester'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'password1234'
    click_button 'Sign Up'

    expect(page).to have_content 'Choose a b&b!'
  end
end
