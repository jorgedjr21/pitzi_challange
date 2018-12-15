require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:order) { build(:order, imei: '', appliance_model: '', anual_price: 0.0) }

  describe 'Given an order' do
    context 'that is invalid' do
      it 'must not save the order' do
        expect { order.save }.not_to change(Order, :count)
      end
    end
  end
end
