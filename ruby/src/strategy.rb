
module Strategy
  class Random
    def select
      [Hand::ROCK, Hand::SCISSORS, Hand::PAPER].sample
    end
  end

  class Only
    def self.use(hand)
      new(hand)
    end

    def initialize(hand)
      @hand = hand
    end

    def select
      @hand
    end
  end

  class Sequence
    def self.order(hands)
      new(hands)
    end

    def initialize(order)
      @order = order
      @index = 0
    end

    def select
      hand = @order[@index]
      @index += 1

      if @order.count <= @index
        @index = 0
      end

      hand
    end
  end
end