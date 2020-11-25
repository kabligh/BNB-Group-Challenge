feature 'Sign in' do
  scenario 'As a user, I want to sign-in for MakersBnB' do
    User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')
    visit '/'
    click_link 'Sign In'
    visit '/users/sign_in'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'password1234'
    click_button 'Sign In'

    expect(page).to have_content 'Choose a b&b!'
  end
end
