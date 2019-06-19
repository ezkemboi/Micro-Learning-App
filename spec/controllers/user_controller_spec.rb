require_relative '../../spec/spec_helper.rb'
require_relative '../../app/controllers/user_controller.rb'

describe 'UserController' do
    user = {"name": "user", "email": "user@email.com", "password": "password"}
    def signup
        visit '/'
        fill_in 'name', with: 'user'
        fill_in 'email', with: 'user@email.com'
        fill_in 'password', with: 'password'
        click_on 'Sign Up'
    end

    def login 
        # Call sign up method then login
        signup
        visit '/login'
        fill_in 'email', with: 'user@email.com'
        fill_in 'password', with: 'password'
        click_on 'Log In'
    end

    it 'should return login page' do 
        visit '/login'
        expect(current_path).to eq('/login')
    end

    it 'should register a new user' do 
        signup
        expect(current_path).to eq('/login')
    end

    it 'should login user to the system' do
        login
        expect(current_path).to eq('/dashboard')
    end

    it 'should redirect to login back home if user does not exist' do
        signup
        visit '/login'
        fill_in 'email', with: 'doenotexit@email.com'
        fill_in 'password', with: 'password'
        click_on 'Log In'
        expect(current_path).to eq('/')
    end

    it 'should return to login page if logged out' do
        visit '/logout'
        expect(current_path).to eq('/login')
    end
end