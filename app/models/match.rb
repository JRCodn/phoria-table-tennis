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
class Match < ApplicationRecord
  has_many :match_players
  has_many :players, through: :match_players

  validates :time, presence: true
end
