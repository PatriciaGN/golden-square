class GrammarStats
    def initialize
      @counter_attempts = 0
      @counter_passed = 0
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
      @counter_attempts += 1
      result = !!(text =~ /^[A-Z][\s\S]*?\+?[.?!](?:\n\n|$)/) 
      @counter_passed += 1 if result == true
      return result
    end
  
    def percentage_good
      fail "No texts have been introduced" if @counter_attempts == 0
      (@counter_passed.to_f / @counter_attempts * 100).to_i
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    end
  end