require 'rails_helper'

RSpec.describe Mission::MissionsController, type: :controller do
  describe '#my_missions' do
    let!(:user) { create(:user) }
    let!(:missions) { create_list(:mission, 2, user: user) }
    before { sign_in(user) }

    it 'loads my missions' do
      get 'my_missions'
      expect(controller.instance_variable_get(:@my_missions).count).to eq(2)
    end
  end
end
