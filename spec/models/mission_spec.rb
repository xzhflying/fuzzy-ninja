require 'rails_helper'

RSpec.describe Mission, type: :model do
  it { is_expected.to belong_to(:user).inverse_of(:missions) }
  it { is_expected.to belong_to(:supervisor).inverse_of(:supervisions) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
end
