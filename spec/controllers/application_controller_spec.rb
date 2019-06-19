require_relative '../../spec/spec_helper'
require_relative '../../app/controllers/application_controller'

describe 'ApplicationController' do
    it 'should return homepage' do
        visit '/'
        expect(current_path).to eq('/')
    end
end
