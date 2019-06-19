require_relative '../../spec/spec_helper.rb'
require_relative '../../app/controllers/article_controller.rb'

describe 'ArticleController' do
    def loginanotheruser
        visit '/'
        fill_in 'name', with: 'user'
        fill_in 'email', with: 'anotheruser@email.com'
        fill_in 'password', with: 'password'
        click_on 'Sign Up'
        visit '/login'
        fill_in 'email', with: 'anotheruser@email.com'
        fill_in 'password', with: 'password'
        click_on 'Log In'
    end

    it 'should return dashboard' do
        visit '/'
        fill_in 'name', with: 'user'
        fill_in 'email', with: 'user@email.com'
        fill_in 'password', with: 'password'
        click_on 'Sign Up'
        visit '/login'
        fill_in 'email', with: 'user@email.com'
        fill_in 'password', with: 'password'
        click_on 'Log In'
        visit '/dashboard'
        expect(current_path).to eq('/dashboard')
    end
    it 'should return post article url' do 
        visit '/article'
        expect(current_path).to eq('/article')
    end

    it 'should find an article when when user does not have any' do
        loginanotheruser
        visit '/dashboard'
        fill_in 'searchtopic', with: 'united states'
        click_on 'Submit'
        expect(current_path).to eq('/dashboard')
    end

end