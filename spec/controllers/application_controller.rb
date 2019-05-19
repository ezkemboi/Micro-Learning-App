require_relative '../../spec/spec_helper'
require_relative '../../app/controllers/application_controller'

describe 'ApplicationController' do
    it 'should return homepage' do
        visit '/'
        expect(current_path).to eq('/')
        # expect(last_response.status).to eq(200)
        # expect(last_response.body).to eq('Micro Learning App')
    end
    it 'should return dashboard' do
        visit '/dashboard'
        expect(current_path).to eq('/dashboard')
    end
    
end
