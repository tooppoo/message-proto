
class Game
  def initialize(players)
    @players = players
  end

  def play
    judge = Judge.new

    @players.each do |player|
      player.show_hand
    end

    judge.judge_hand
  end
end

class Judge
  def initialize
    @players_by_hand = {}
    MailBox.instance.listen(Message::SHOW_HAND) do |data|
      player = data[:player]
      hand = data[:hand]

      @players_by_hand[hand] ||= []
      @players_by_hand[hand] << player
    end
  end

  def judge_hand
    if @players_by_hand.keys.count === 1 || @players_by_hand.keys.count === 3
      MailBox.instance.send_message(Message::DRAW, nil) 
      return
    end

    h1, h2 = @players_by_hand.keys
    result = Hand.battle(h1, h2)

    if result[:draw]
      MailBox.instance.send_message(Message::DRAW, nil)
      return
    end

    @players_by_hand[result[:winner]].each do |winner|
      MailBox.instance.send_message(Message::WIN, winner)
    end
    @players_by_hand[result[:loser]].each do |loser|
      MailBox.instance.send_message(Message::LOSE, loser)
    end
  end
end
