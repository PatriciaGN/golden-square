def todo_checker(text)
    fail "Please, give me a string!" unless text.is_a? String
    if text == ""
        fail "Please, give me some text!"
    elsif text.include?("TODO")
        return true
    else
        return false
    end
end