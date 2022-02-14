class Robot
  @@names = []

  def name
    return @name if @name

    @name = set_name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def set_name
    name = ''

    loop do
      name = ''
      2.times { name << ('A'..'Z').to_a.sample }
      3.times { name << ('0'..'9').to_a.sample }
      break unless @@names.include?(name)
    end

    @@names << name
    name
  end
end
