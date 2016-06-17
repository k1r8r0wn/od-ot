module AuthenticationHelpers
  module Controller
    def sign_in(user)
       allow(controller).to receive(:current_user).and_return(user)
    end
  end

  module Feature
    def sign_in(user, options={})
      visit '/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: options[:password]
      click_button 'Sign In'
    end
  end
end
