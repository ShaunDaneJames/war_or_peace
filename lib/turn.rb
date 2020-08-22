class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :players,
              :winner_of_turn

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
      type = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) !=
      @player2.deck.rank_of_card_at(0)
      type = :basic
    elsif @player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0)
      type = :war
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

  def pile_cards
    if type == :mutually_assured_destruction
      @players.map { |player| 3.times {player.deck.remove_card}}
    elsif type == :basic
      @players.each { |player| @spoils_of_war << player.deck.cards.shift}
    elsif type == :war
      3.times {@players.each { |player| @spoils_of_war << player.deck.cards.shift}}
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each {|card| winner.deck.cards << card}
  end

end
