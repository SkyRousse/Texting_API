require 'rails_helper'

describe Message, :vcr => true do
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '+15034873958')
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
