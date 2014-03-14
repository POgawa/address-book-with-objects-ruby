require 'rspec'
require 'term'

# describe Dictionary do
#   Term.clear
#   it 'should initialize Dictionay' do
#     new_dictionary = Dictionary.new(title)
#     new_dictionary.should be_an_instance_of Dictionary
#   end
#   it 'should create a title for Dictionary' do
#     new_dictionary = Dictionary.create'Websters'
#     new_dictionary.create.should eq'Websters'
#   end
# end

describe Definition do
  it 'should initialize the Definition' do
   new_definition = Definition.new('A not so delicious vegetable unless its cake')
   new_definition.should be_an_instance_of Definition
 end
end

describe Word do

  it 'should initialize the Word' do
    new_word = Word.new('carrot')
    new_word.should be_an_instance_of Word
  end
  it 'should reurn the value of the word' do
    new_word = Word.new('carrot')
    new_word.word.should eq'carrot'
  end
end

describe Term do
  it 'should initialize the Term' do
    new_word = Word.new('carrot')
    new_definition = Definition.new('yummy vegetable')
    new_term = Term.new(new_word, new_definition)
    new_term.should be_an_instance_of Term
  end

  it 'saves the term into the array of terms' do

    new_term = Term.create('carrot', 'yummy vegetable')
    Term.all.should eq [new_term]
  end
end



