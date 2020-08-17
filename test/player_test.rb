require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists_with_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Calvin', deck)

    assert_instance_of Player, player
    assert_equal "Calvin", player.name
    assert_equal deck, player.deck
  end

  def test_knows_who_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Calvin', deck)

    refute player.has_lost?
    player.deck.remove_card
    refute player.has_lost?
    player.deck.remove_card
    refute player.has_lost?
    player.deck.remove_card
    assert player.has_lost?
  end
end
