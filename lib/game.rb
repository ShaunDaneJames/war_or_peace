class Game
  attr_reader :starting_deck,
              :turn_count

  def initialize
    @starting_deck = create_starting_deck
    @turn_count = 0
    @player1 = Player.new("Calvin", Deck.new([]))
    @player2 = Player.new("Hobbes", Deck.new([]))
    @turn = Turn.new(@player1, @player2)
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    user_input = gets.chomp.upcase
    if user_input == "GO"
      shuffle_cards
    else
      puts "Please type 'go', the case doesn't matter."
      puts "\n"
      sleep(2)
      start
    end
  end

  def create_starting_deck
    [card1 = Card.new(:heart, '2', 2),
    card2  = Card.new(:heart, '3', 3),
    card3  = Card.new(:heart, '4', 4),
    card4  = Card.new(:heart, '5', 5),
    card5  = Card.new(:heart, '6', 6),
    card6  = Card.new(:heart, '7', 7),
    card7  = Card.new(:heart, '8', 8),
    card8  = Card.new(:heart, '9', 9),
    card9  = Card.new(:heart, '10', 10),
    card10 = Card.new(:heart, 'Jack', 11),
    card11 = Card.new(:heart, 'Queen', 12),
    card12 = Card.new(:heart, 'King', 13),
    card13 = Card.new(:heart, 'Ace', 14),
    card14 = Card.new(:diamond, '2', 2),
    card15 = Card.new(:diamond, '3', 3),
    card16 = Card.new(:diamond, '4', 4),
    card17 = Card.new(:diamond, '5', 5),
    card18 = Card.new(:diamond, '6', 6),
    card19 = Card.new(:diamond, '7', 7),
    card20 = Card.new(:diamond, '8', 8),
    card21 = Card.new(:diamond, '9', 9),
    card22 = Card.new(:diamond, '10', 10),
    card23 = Card.new(:diamond, 'Jack', 11),
    card24 = Card.new(:diamond, 'Queen', 12),
    card25 = Card.new(:diamond, 'King', 13),
    card26 = Card.new(:diamond, 'Ace', 14),
    card27 = Card.new(:spade, '2', 2),
    card28 = Card.new(:spade, '3', 3),
    card29 = Card.new(:spade, '4', 4),
    card30 = Card.new(:spade, '5', 5),
    card31 = Card.new(:spade, '6', 6),
    card32 = Card.new(:spade, '7', 7),
    card33 = Card.new(:spade, '8', 8),
    card34 = Card.new(:spade, '9', 9),
    card35 = Card.new(:spade, '10', 10),
    card36 = Card.new(:spade, 'Jack', 11),
    card37 = Card.new(:spade, 'Queen', 12),
    card38 = Card.new(:spade, 'King', 13),
    card39 = Card.new(:spade, 'Ace', 14),
    card40 = Card.new(:club, '2', 2),
    card41 = Card.new(:club, '3', 3),
    card42 = Card.new(:club, '4', 4),
    card43 = Card.new(:club, '5', 5),
    card44 = Card.new(:club, '6', 6),
    card45 = Card.new(:club, '7', 7),
    card46 = Card.new(:club, '8', 8),
    card47 = Card.new(:club, '9', 9),
    card48 = Card.new(:club, '10', 10),
    card49 = Card.new(:club, 'Jack', 11),
    card50 = Card.new(:club, 'Queen', 12),
    card51 = Card.new(:club, 'King', 13),
    card52 = Card.new(:club, 'Ace', 14)]
    # 10.times {|number|Card.new(:heart, 'number', number)}
  end


  def shuffle_cards
    shuffled_deck = @starting_deck.shuffle
    @player1.deck.add_card(shuffled_deck[0..25]).flatten!
    @player2.deck.add_card(shuffled_deck[26..-1]).flatten!
    run
  end

  def run
    until @player1.has_lost? || @player2.has_lost? || @turn_count == 1000000
    @turn.pile_cards
      if @turn.type == :basic
        puts "Turn #{@turn_count}: #{@turn.type} -
        #{@turn.winner.name} has won 2 cards"
        @turn.award_spoils(@turn.winner)
      elsif @turn.type == :war
        puts "Turn #{@turn_count}: #{@turn.type} -
        #{@turn.winner.name} has won 6 cards"
      else
        puts "*#{@turn.type}* 6 cards removed from play"
      end
      @turn_count += 1
    end
    outcome
  end

  def outcome
    if @turn_count >= 1000000
      puts "---- DRAW ----"
    elsif !@player1.has_lost?
      puts "*~*~*~*#{@player1.name} has won the game!*~*~*~*"
    elsif !@player2.has_lost?
      puts "*~*~*~*#{@player2.name} has won the game!*~*~*~*"
    else
      puts "Oops! Something went wrong :/"
    end
  end

end
