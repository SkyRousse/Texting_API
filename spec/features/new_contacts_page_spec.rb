require 'rails_helper'

describe 'the add a new contact process', :vcr => true do
  it 'creates a new contact' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit new_contact_path
    fill_in 'Name', :with => "Sky"
    fill_in 'Phone', :with => "5033581431"
    click_on "Create Contact"
    expect(page).to have_content "Sky"
  end
end
