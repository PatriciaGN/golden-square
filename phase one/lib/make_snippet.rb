def make_snippet(sentence)
  arr_words = sentence.split(" ")
  if arr_words.count > 5
      return arr_words[0..4].join(" ") + "..."
  else
    return sentence
  end
end


puts personal_word("cat dog fish bird shark tiger")