require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_attributes
  end

  def test_cognizant_of_card_rank
  end

  def test_cognizant_of_high_ranking_cards
  end

  def test_knows_percentage_of_high_ranking_cards
  end

  def test_it_can_remove_cards
  end

  def test_it_can_add_cards
  end

end
