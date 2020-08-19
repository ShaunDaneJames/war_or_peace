class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :players

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @players = [@player1, @player2]
  end

  def type
    if (@player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0)) &&
      (@player1.deck.rank_of_card_at(2) ==
      @player2.deck.rank_of_card_at(2))
      turn = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) !=
    @player2.deck.rank_of_card_at(0)
    turn = :basic
    elsif @player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0)
      turn = :war
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :basic
      @players.max_by { |player| player.deck.rank_of_card_at(0) }
    elsif type == :war
      @players.max_by { |player| player.deck.rank_of_card_at(2) }
    end
  end

end
