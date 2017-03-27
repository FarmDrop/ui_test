module LoginSteps

# Existing user can login using this, provided user name and password
# and being on login/signin page
    def login(name, password)
        @url_login = Capybara.current_url
        click_on 'Sign up or Log in' unless @url_login.to_s.include?('login')
        fill_in('email', :with => name)
        fill_in('password', :with => password)
        find(:button, 'Log in').click
        sleep 1
    end

    def signup(user = false, password = Configuration['password'] , postcode = Configuration['post_code'])
        # @url_login = Capybara.current_url
        # click_on 'Sign up' unless @url_login.to_s.include?('signup')
        visit '/signup'

        if user == false  
            time = Time.new
            user = 'qa+' + time.usec.to_s + time.yday.to_s + '@farmdrop.com'
        end

        fill_in('user[email]', :with => user)
        fill_in('user[password]', :with => password)
        fill_in('user[zipcode]', :with => postcode)
        find(:button, 'Let\'s fix the food chain').click
        sleep 1
    end

    def logout
        sleep 1
        find(:xpath,"//a[@class='navigation-main-login-icon']").click
        sleep 1
        click_on 'logout'
        sleep 1
    end
end

World(LoginSteps)
