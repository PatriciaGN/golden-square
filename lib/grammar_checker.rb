def grammar_checker(text)
    fail "Please, give me some text!" if text == ""
    fail "Please, give me a string!" if ! text.is_a? String
    text =~ /^[A-Z][\s\S]*?\+?[.?!](?:\n\n|$)/ ? true : false
end

