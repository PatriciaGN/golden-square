class InteractiveCalculator
    def initialize(io)
      @io = io
    end

    def run
      @io.puts "Hello. I will subtract two numbers."
      @io.puts "Please enter a number"
      number1 = @io.gets.chomp.to_i
      @io.puts "Please enter another number"
      number2 = @io.gets.chomp.to_i
      @io.puts "Here is your result:"
      result = number1 - number2
      @io.puts "#{number1} - #{number2} = #{result}"
    end

end


interactive_calculator = InteractiveCalculator.new(Kernel)
interactive_calculator.run

