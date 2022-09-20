phone_list = []

def phone_list
    puts entry
    puts entry.match?(/[\d]{11}/)
    if entry.match?(/[\d]{11}/)
        puts entry.match?(/[\d]{11}/)
        phone_list << entry.match(/[\d]{11}/)[0]
        puts entry.match(/[\d]{11}/)[0]
    end
end

entry =  "I went for a walk with my friend, their number was 07575569329"

puts entry.match?(/[\d]{11}/)
match = entry.match(/[\d]{11}/)[0]
puts match
puts phone_list