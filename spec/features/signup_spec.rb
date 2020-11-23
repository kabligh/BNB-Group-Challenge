feature 'Sign up' do
  scenario 'As a user, I want to sign-up for BNB makers' do
    visit '/users/new'
    fill_in 'name', with: 'Margarida'
    fill_in 'email', with: 'marg@gmail.com'
    fill_in 'password', with: 'password1234'
    click_button 'Sign Up'

    expect(page).to have_content "Welcome to Makers BnB!"
  end
end
