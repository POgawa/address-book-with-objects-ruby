require '.lib/term'

class Dictionary
  # attr_reader :name, :terms

  @@dictionary = []

  def initialize(name)
    @name = name
    @definitions = []
    @words = []
  end

  def Dictionary.create(name)
    new_dictionary = Dictionary.new(name)
    new_dictionary.save
    new_dictionary
  end

  def save
    @@dictionary << self
  end

  def name
    @name
  end

  def Dictionary.clear
    @@dictionary = []
  end

  def Dictionary.all
    @@dictionary
  end

  def add_word(word)
    new_word = Word.new(word)
    @words << new_word
  end

  def word
    @words
  end

  def add_definitions(definition)
    new_definition = Definition.new(definition)
    @definitions << new_definition
  end

end






