
require_relative 'src/game'
require_relative 'src/hand'
require_relative 'src/player'
require_relative 'src/strategy'

players = [
  Player.new('Hoge', Strategy::Only.use(       Hand::ROCK)),
  Player.new('Fuga', Strategy::Sequence.order([Hand::ROCK, Hand::PAPER, Hand::SCISSORS])),
  Player.new('Piyo', Strategy::Sequence.order([Hand::PAPER, Hand::SCISSORS, Hand::ROCK, Hand::ROCK, Hand::SCISSORS])),
]

game = Game.new(players)

5.times do
  game.play
end

players.each do |player|
  puts "#{player.name}: 勝ち #{player.win}, 負け #{player.lose}, 引き分け #{player.draw}"
end
