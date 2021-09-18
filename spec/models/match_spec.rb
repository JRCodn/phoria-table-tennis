# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  score      :string
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "#score_is_legal" do
    it 'can have no score' do
      expect(FactoryBot.build(:match, score: nil)).to be_valid
    end

    context 'with a score' do
      it 'is formatted with two scores and a dash separating them' do
        expect(FactoryBot.build(:match, score: '21-18')).to be_valid
        expect(FactoryBot.build(:match, score: '21 18')).to be_invalid
      end

      it 'must have a winner' do
        expect(FactoryBot.build(:match, score: '15-18')).to be_invalid
      end

      it 'must be won by at least 2 points' do
        expect(FactoryBot.build(:match, score: '21-20')).to be_invalid
      end

      it 'can go to into overtime' do
        expect(FactoryBot.build(:match, score: '22-24')).to be_valid
      end

      it 'cannot have a score above 21 unless the score is two points apart' do
        expect(FactoryBot.build(:match, score: '50-1')).to be_invalid
      end
    end
  end
end
