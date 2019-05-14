require 'minitest/autorun'
require File.expand_path '../app.rb', __FILE__

describe 'my start page' do
    it 'should successfully return welcome to Micro learning app' do
        get '/'
        last_response.body.must_include 'Welcome To Micro Learning App'
    end
end
