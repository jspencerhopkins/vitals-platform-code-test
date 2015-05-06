class NormalItem

  attr_accessor :expires_in, :quality

  def initialize(expires_in, quality)
    @expires_in = expires_in
    @quality = quality
  end

  def update
    @expires_in -= 1
    self.decrease_quality(1)
    self.decrease_quality(1) if @expires_in <= 0
  end

  def increase_quality(amt)
    @quality = [50, @quality += amt].min
  end

  def decrease_quality(amt)
    @quality = [0, @quality -= amt].max
  end

end

# BlueFirst inherits NormalItem features
class BlueFirst < NormalItem

  def update
    @expires_in -= 1
    self.increase_quality(1)
    self.increase_quality(1) if @expires_in <= 0
  end

end

class BlueCompare < NormalItem

  def update
    @expires_in -= 1
    if @expires_in < 0
      @quality = 0
    elsif @expires_in < 5
      self.increase_quality(3)
    elsif @expires_in < 10
      self.increase_quality(2)
    else
      self.increase_quality(1)
    end
  end

end

class BlueDistinctionPlus < NormalItem

  def update
  end

end