require_relative '../../spec/spec_helper.rb'
require_relative '../../app/controllers/user_controller.rb'

describe 'UserController' do
    it 'should return login page' do 
        visit '/login'
        expect(current_path).to eq('/login')
    end

    it 'should register a new user' do 
        visit '/'
        fill_in 'name', with: 'user'
        fill_in 'email', with: 'user@email.com'
        fill_in 'password', with: 'password'
        click_on 'Sign Up'
        # expect(current_path).to eq('/login')
        expect(current_path).to eq('/register_user')
    end

    it('should login user to the system') do
        visit '/login'
        fill_in 'email', with: 'user@email.com'
        fill_in 'password', with: 'password'
        click_on 'Log In'
        # expect(current_path).to eq('/dashboard')
        expect(current_path).to eq('/login_user')
    end
end