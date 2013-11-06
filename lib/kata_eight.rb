require 'optparse'
require 'set'

class KataEight
  attr_accessor :possible_matches, :words

  def initialize(word_length=6)
    @words            = []
    @possible_matches = Set.new
    @word_length      = word_length
  end

  def parse_file(filename)
    file = File.open(filename)

    file.each_line do |line|
      word = line.scan(/\w+/).first or next
      possible_matches << word if word.length <= word_length - 2
      words            << word if word.length == word_length
    end
  end

  def find_words
    result = []
    words.each do |word|
      (1..(word_length-1)).each do |index|
        left, right = word[0..index], word[index+1..word.length]
        if possible_matches.member?(left) && possible_matches.member?(right)
          result << [left, right, word]
        end
      end
    end
    result
  end

  def print_result(result)
    result.each { |left, right, word| puts "#{left} + #{right} => #{word}" }
  end

  private
    attr_reader :word_length

end

