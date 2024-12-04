require 'rails_helper'

RSpec.describe TrainingItem, type: :model do
  describe 'validation' do
    context '正常系' do
      it '有効である' do
        training_item = FactoryBot.build(:training_item)
        expect(training_item).to be_valid
      end
    end

    context '異常系' do
      it 'nameが空の場合' do
        training_item = FactoryBot.build(:training_item, name: nil)
        expect(training_item).not_to be_valid
      end

      it 'nameが100文字を超える場合' do
        training_item = FactoryBot.build(:training_item, name: 'a' * 101)
        expect(training_item).not_to be_valid
      end

      it 'weight_unitが空の場合' do
        training_item = FactoryBot.build(:training_item, weight_unit: nil)
        expect(training_item).not_to be_valid
      end

      it 'weight_unitが1, 2以外の場合' do
        training_item = FactoryBot.build(:training_item, weight_unit: 3)
        expect(training_item).not_to be_valid
      end
    end
  end
end
