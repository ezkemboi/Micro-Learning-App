require_relative '../../spec/spec_helper.rb'
require_relative '../../app/controllers/user_controller'

describe 'UserController' do
    it 'should return register page' do
        visit '/register'
        expect(current_path).to eq('/register')
    end

    it 'should return login page' do 
        visit '/login'
        expect(current_path).to eq('/login')
    end
end