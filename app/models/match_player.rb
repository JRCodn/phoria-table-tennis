# == Schema Information
#
# Table name: match_players
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  match_id   :integer          not null
#  player_id  :integer          not null
#
class MatchPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :match
end
