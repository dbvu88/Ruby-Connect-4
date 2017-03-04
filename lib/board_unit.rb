class BoardUnit
  attr_accessor :player

  def occupied?
    !@player.nil?
  end

  def to_char
    if @player
      @player.char
    else
      ' '
    end
  end
end
