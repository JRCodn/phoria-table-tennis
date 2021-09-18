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
FactoryBot.define do
  factory :match do
    time { Time.zone.now + 1.day }
  end
end
