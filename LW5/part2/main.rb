# coding: utf-8

def correct(words, word_to_correct)
  words.each_index do |i|
    words[i] = nil if words[i][0] == 'л' && i.even?
    words[i] = word_to_correct if words[i][0] == 'н' && i.odd?
  end

  return words.compact
end
