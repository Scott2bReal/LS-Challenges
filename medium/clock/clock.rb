class Clock
  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def to_s
    "#{format('%02d', @hours)}:#{format('%02d', @minutes)}"
  end

  def +(minutes)
    @minutes += minutes
    diff = @minutes.divmod(60)
    @minutes = diff[1]
    @hours += diff[0]
    self
  end

  def -(minutes)
    diff = minutes.divmod(60)
    @hours -= diff[0]
    @hours += 23 if @hours <= 0
    @minutes -= diff[1]
    @minutes += 60 if @minutes < 0
    self
  end
end
