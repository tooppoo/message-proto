
module Hand
  ROCK = :rock
  PAPER = :paper
  SCISSORS = :scissors

  def self.battle(h1, h2)
    if h1 == h2
      { draw: true, winner: nil, loser: nil }
    elsif (
      (h1 == ROCK && h2 == SCISSORS) ||
      (h1 == PAPER && h2 == ROCK) ||
      (h1 == SCISSORS && h2 == PAPER)
    )
      { draw: false, winner: h1, loser: h2 }
    else
      { draw: false, winner: h2, loser: h1 }
    end
  end
end
