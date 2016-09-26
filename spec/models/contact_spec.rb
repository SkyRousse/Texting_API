require 'rails_helper'

RSpec.describe Contact do
  it { should belong_to :user }
end
