# coding: utf-8

def correct(words, word_to_correct)
  words.each_index do |i|
    words[i] = nil if i.even? && words[i][0] == 'л'
    words[i] = word_to_correct if i.odd? && words[i][0] == 'н'
  end

  words.compact
end
