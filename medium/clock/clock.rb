class Clock
  MINUTES_IN_A_DAY = 1440

  attr_reader :hours, :minutes

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    new(hour, minutes)
  end

  def to_s
    "#{format('%02d', @hours)}:#{format('%02d', @minutes)}"
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def +(time_added)
    new_minutes = time_added + minutes_since_midnight

    until new_minutes < MINUTES_IN_A_DAY
      new_minutes -= MINUTES_IN_A_DAY
    end

    new_time = minutes_since_midnight_to_time(new_minutes)
    Clock.new(new_time[0], new_time[1])
  end

  def -(time_subtracted)
    new_minutes = minutes_since_midnight - time_subtracted

    until (0...MINUTES_IN_A_DAY).cover? new_minutes
      new_minutes += MINUTES_IN_A_DAY
    end

    new_time = minutes_since_midnight_to_time(new_minutes)
    Clock.new(new_time[0], new_time[1])
  end

  private

  def minutes_since_midnight
    minutes = (60 * @hours) + @minutes

    until minutes < MINUTES_IN_A_DAY
      minutes -= MINUTES_IN_A_DAY
    end

    minutes
  end

  def minutes_since_midnight_to_time(minutes)
    minutes.divmod(60)
  end
end
