feature 'Sign up' do
  scenario 'As a user, I want to sign-up for MakersBnB' do
    visit '/'
    fill_in 'name', with: 'Tester'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'password1234'
    click_button 'Sign up'

    expect(page).to have_content 'Book a space'
  end
end
