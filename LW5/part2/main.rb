def correct(words, word_to_correct)
  words.each_with_index.map do |word, i|
    if i.even? && word[0] == 'л'
      nil
    elsif i.odd? && word[0] == 'н'
      word_to_correct
    else
      word
    end
  end.compact
end
