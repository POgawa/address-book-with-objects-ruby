require './lib/definition'
require './lib/word'

class Term

  @@terms = []

  attr_reader :term

  def initialize(word, definition)
    @word = word
    @definition = definition

  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def Term.clear
    @@terms =[]
  end

  def save
    @@terms << self
  end

  def change_value(new_value)
    @value = new_value
  end

  def Term.all
    @@terms
  end
end

# class Definition < Term
#   # def initialize(definition)
#   #   @definitnion = definition
#   # end
# end

# class Word < Term
#   # def initialize(word)
#   #   @word = word
#   # end
# end



#   attr_reader(:word, :definition)

#   @@terms = []

#   def initialize(word, definition)
#     @word = word
#     @definition = definition
#     @@terms << self
#   end

#   # def term
#   #   @term = term
#   # end



# end
