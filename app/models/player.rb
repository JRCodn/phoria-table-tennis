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
class Player < ApplicationRecord
  has_many :match_players
  has_many :matches, through: :match_players

  validates :first_name, :last_name, presence: true, allow_blank: false

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
