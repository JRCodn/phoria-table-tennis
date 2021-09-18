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
  validate :check_score

  def check_score
    reg = /\b(\d{1}|\d{2})-(\d{1}|\d{2})\b/
    splitScore = score.split("-").map(&:to_i)
    if !reg.match?(score)
      errors.add(:score, "sorry that's an invalid score format, must be two scores seperated by a dash")
      #check if there is a winner and that they have won by more than 2 points
    elsif splitScore.max < 21
      errors.add(:score, "Match must have a winner")
    elsif splitScore.inject(:-) < 2
      errors.add(:score, "must be won by at least 2 points")
    elsif splitScore.inject(:-) == 2 && splitScore.min >= 21
      errors.add(:score, 'can go to into overtime')
    elsif splitScore.inject(:+) > 2 && splitScore.max > 21
      errors.add(:score, 'cannot have a score above 21 unless the score is two points apart')
    end
  end
end
