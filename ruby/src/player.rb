require_relative './mail_box'
require_relative './message'

class Player
  attr_reader :name, :win, :lose, :draw

  def initialize(name, strategy)
    @name = name
    @strategy = strategy
    @win = 0
    @lose = 0
    @draw = 0

    MailBox.instance.listen(Message::WIN) do |who|
      if who == self
        @win += 1
      end
    end
    MailBox.instance.listen(Message::LOSE) do |who|
      if who == self
        @lose += 1
      end
    end
    MailBox.instance.listen(Message::DRAW) do
      @draw += 1
    end
  end


  def show_hand
    hand = @strategy.select

    MailBox.instance.send_message(Message::SHOW_HAND, { hand: hand, player: self })
  end

  def ==(other)
    @name == other.name
  end
end