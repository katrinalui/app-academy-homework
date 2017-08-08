class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1, @name2 = name1, name2
    place_stones
  end

  def place_stones
    playable_cups = [*0..5] + [*7..12]
    playable_cups.each { |i| 4.times { @cups[i] << :stone } }
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 5) || start_pos.between?(7, 12)
    raise 'Invalid starting cup' if @cups[start_pos].empty?

    # true
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13 #restarts cup_idx at 0 after last cup

      if cup_idx == 6
        @cups[cup_idx] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[cup_idx] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[13].length > @cups[6].length
      @name2
    else
      :draw
    end
  end
end
