# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "#full_name" do
    let(:player) do
      FactoryBot.create(:player, first_name: 'Homer', last_name: 'Simpson')
    end

    it 'returns the full name of the player' do
      expect(player.full_name).to eq('Homer Simpson')
    end
  end
end
