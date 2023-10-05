require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts "The name of the Person is: #{person.correct_name}"
capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}, count: #{person.correct_name.length}"
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Trimmed Name: #{capitalized_trimmed_person.correct_name}, count: #{capitalized_trimmed_person.correct_name.length}"