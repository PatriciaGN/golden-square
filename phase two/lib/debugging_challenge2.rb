def get_most_common_letter(text)
    counter = Hash.new(0)
    text.gsub(/\s+/, "").chars.each do |char|
      counter[char] += 1
    end
    counter.to_a.sort_by { |k, v| -v }[0][0]
  end
  

  get_most_common_letter("the roof, the roof, the roof is on fire!")
=begin
ORIGINAL
  def get_most_common_letter(text)
    counter = Hash.new(0)
    text.chars.each do |char|
      counter[char] += 1
    end
    counter.to_a.sort_by { |k, v| v }[0][0]
  end
  =end
  
  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"