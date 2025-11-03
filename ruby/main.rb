
require_relative 'src/game'
require_relative 'src/hand'
require_relative 'src/player'
require_relative 'src/strategy'

rockman = Player.new('RockMan', Strategy::Only.use(Hand::ROCK))
players = [rockman] + (10.times.map { |i| Player.new("Rnd#{i + 1}", Strategy::Random.new) })

game = Game.new(players)

until rockman.win >= 10
  game.play
end

players.each do |player|
  puts "#{player.name}: 勝ち #{player.win}, 負け #{player.lose}, 引き分け #{player.draw}"
end
