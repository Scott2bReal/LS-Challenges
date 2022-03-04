class Robot
  @@names = []

  attr_accessor :name

  def initialize
    @name = generate_name
    @@names << @name
  end

  def reset
    @@names.delete(name)
    @name = generate_name
    @@names << @name
  end

  private

  def generate_name
    new_name = ''

    loop do
      2.times { new_name << ('A'..'Z').to_a.sample }
      3.times { new_name << ('0'..'9').to_a.sample }
      break unless @@names.include?(new_name)

      new_name = ''
    end

    new_name
  end
end
