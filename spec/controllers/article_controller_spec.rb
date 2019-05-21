require_relative '../../spec/spec_helper.rb'
require_relative '../../app/controllers/article_controller.rb'

describe 'ArticleController' do
    it 'should return dashboard' do 
        visit '/dashboard'
        expect(current_path).to eq('/dashboard')
    end

    it 'should return post article url' do 
        visit '/article'
        expect(current_path).to eq('/article')
    end

    it 'should search for an article' do
        visit '/dashboard'
        fill_in 'searchtopic', with: 'ruby'
        click_button 'Submit'
        expect(current_path).to eq('/article')
    end
end