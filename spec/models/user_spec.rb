require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:missions).dependent(:destroy) }
  it { is_expected.to have_many(:comments).inverse_of(:user) }
  it { is_expected.to have_many(:supervisions).inverse_of(:supervisor) }
end
