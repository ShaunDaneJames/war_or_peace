class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all {|card| card.rank > 10}
  end

  def percent_of_high_ranking_cards
    ((high_ranking_cards.count / @cards.count.to_f) * 100).round(2)
  end
end
