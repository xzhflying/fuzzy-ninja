require 'rails_helper'

RSpec.describe Mission::Comment, type: :model do
  it { is_expected.to belong_to(:user).inverse_of(:comments) }
  it { is_expected.to belong_to(:commentable) }
end
