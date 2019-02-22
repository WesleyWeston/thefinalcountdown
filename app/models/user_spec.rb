require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do 
    it 'creates a new user with valid data' do
        expect(User.create(username: 'aqsgdgf', email: 'test@example.com', password: 'qwertyu')).to be_valid
    end

    it 'creates a new user without name' do
        expect{ User.create!(email: 'test@example.com', password: 'qwertyu') }.to raise_error('Validation failed: Name can\'t be blank')
    end
end
end