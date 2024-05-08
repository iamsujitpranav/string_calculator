require './string_calculator'

input = ARGV.join(" ").gsub('\\n', "\n")
puts StringCalculator.add(input)