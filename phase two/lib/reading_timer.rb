# “reading_timer” calculates the time required to read a text
# total_time = reading_timer(text)

# text: a string of words (e.g. “I need to read this super fast”)
# total_time: float - total number of minutes (e.g. 243535)

# This method doesn’t print anything or have any other side-effects

def reading_timer(text)
    fail "Please, give me a string!" unless text.is_a? String 
    words = text.split(" ").count
    return (words / 200.0).ceil
end

