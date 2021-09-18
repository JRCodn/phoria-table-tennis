# Players
Player.create(first_name: 'Marge', last_name: 'Simpson')
Player.create(first_name: 'Homer', last_name: 'Simpson')
Player.create(first_name: 'Lisa', last_name: 'Simpson')
Player.create(first_name: 'Bart', last_name: 'Simpson')
Player.create(first_name: 'Maggie', last_name: 'Simpson')
Player.create(first_name: 'Milhouse', last_name: 'Van Houten')
Player.create(first_name: 'Edna', last_name: 'Krabappel')
Player.create(first_name: 'Ralph', last_name: 'Wiggum')
Player.create(first_name: 'Selma', last_name: 'Bouvier')
Player.create(first_name: 'Seymour', last_name: 'Skinner')

# Matches
Player.all.each do |player|
  time = Time.zone.now
  day = Random.rand(-5..5)
  time += day.days
  hour = Random.rand(9..17)
  time = time.change(hour: hour)

  score = "21-#{Random.rand(0..19)}" if time.past?

  match = Match.create(time: time, score: score)
  opponent = Player.where.not(id: player.id).order('RANDOM()').first
  match.players.push(player, opponent)
end
