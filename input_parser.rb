# InputParser class is responsible for parsing the input string and extracting the delimiter and numbers.
class InputParser

  def initialize(input)
    @input = input
  end

  # Returns the delimiter regex pattern based on the input string.
  # If the input string starts with "//", it extracts the delimiter from the first line.
  # Otherwise, it returns the default delimiter pattern which includes newline and comma.
  
  def delimiter
    return /[\n,]/ unless @input.start_with?("//")

    Regexp.new(Regexp.escape(@input.split("\n").first[2..-1]))
  end
end
