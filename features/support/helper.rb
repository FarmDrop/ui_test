module LoginSteps

# Existing user can login using this, provided user name and password
# and being on login/signin page
    def login(name, password)
        @url_login = Capybara.current_url
        click_on 'Sign up or Log in' unless @url_login.to_s.include?('login')
        fill_in('email', :with => name)
        fill_in('password', :with => password)
        find(:button, 'Login').click
    end

    def signup(user = false, password = Configuration['password'] , postcode = Configuration['post_code'])
        @url_login = Capybara.current_url
        click_on 'Sign up or Log in' unless @url_login.to_s.include?('login')

        if user == false  
            time = Time.new
            user = 'qa+' + time.usec.to_s + time.yday.to_s + '@farmdrop.com'
        end
        
        # time = Time.new
        # temp_user = 'qa+' + time.usec.to_s + time.yday.to_s + '@farmdrop.co.uk'
        # user = temp_user unless user?

        fill_in('user_sign_up_form[email]', :with => user)
        fill_in('user_sign_up_form[password]', :with => password)
        fill_in('user_sign_up_form[zipcode]', :with => postcode)
        find(:button, 'Create your account').click
    end

    def logout
        sleep 3
        find(:link,'fh navigation-main-user-link').click
        #find(:link,'navigation-main-login-icon').click
        #click_link('fh navigation-main-user-link')
        sleep 3
        click_on 'logout'
        sleep 5
    end
end

World(LoginSteps)
