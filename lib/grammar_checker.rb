def grammar_checker(text)
    if text == ""
        fail "Please, give me some text!"
    elsif ! text.is_a? String
        fail "Please, give me a string!"
    else
        return false
    end
end

