require 'date'

class Meetup
  DESCRIPTORS = {
    'first' => (1..7),
    'second' => (8..14),
    'third' => (15..21),
    'fourth' => (22..28),
    'fifth' => (29..31),
    'last' => (22..31),
    'teenth' => [13, 14, 15, 16, 17, 18, 19]
  }

  DAYS = {
    'sunday' => 0,
    'monday' => 1,
    'tuesday' => 2,
    'wednesday' => 3,
    'thursday' => 4,
    'friday' => 5,
    'saturday' => 6
  }

  attr_reader :year, :month, :last_day

  def initialize(year, month)
    @year = year
    @month = month
    @last_day = Date.civil(year, month, -1).day
  end

  def day(day, schedule)
    day = day.downcase
    schedule = schedule.downcase

    DESCRIPTORS[schedule].to_a.each do |date|
      break if date > last_day

      date = Date.civil(year, month, date)
      next if (schedule == 'last') && ((last_day - date.day) > 6)

      return date if date.wday == DAYS[day]
    end

    nil
  end
end
