require 'faker'


class Person
  attr_accessor :first_name, :last_name, :age

  def initialize
    # for faker, to suppress deprecation messsage
    I18n.enforce_available_locales = false

    @first_name = Faker::Name.first_name
    @last_name  = Faker::Name.last_name
    @age        = rand(18..99)
  end

  def inspect
    "#{@first_name} #{@last_name} (#{@age})"
  end
end
