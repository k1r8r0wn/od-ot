require 'rails_helper'

describe 'Logging In' do
  it 'logs the user in and goes to the todo lists' do
    User.create(
      first_name: 'John',
      last_name: 'Doe',
      email: 'john@doe.com',
      password: 'password1234',
      password_confirmation: 'password1234'
    )

    visit sign_in_path
    fill_in 'Email', with: 'john@doe.com'
    fill_in 'Password', with: 'password1234'
    click_button 'Sign In'
    expect(page).to have_content('Todo Lists')
    expect(page).to have_content('Thanks for signing in!')
  end

  it 'displays the email address in the event of a failed login' do
    visit sign_in_path
    fill_in 'Email', with: 'john@doe.com'
    fill_in 'Password', with: 'incorrect'
    click_button 'Sign In'

    expect(page).to have_content('Please check your email and password')
    expect(page).to have_field('Email', with: 'john@doe.com')
  end
end
