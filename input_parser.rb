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

  # Returns an array of numbers extracted from the input string.
  # It validates the input string and raises an exception if it is invalid.
  # If the input string starts with "//", it extracts the numbers from the second line.
  # Otherwise, it extracts the numbers from the first line.
  def numbers
    validate_input
    return @input.split(delimiter).map(&:to_i) unless @input.start_with?("//")

    @input.split("\n").last.split(delimiter).map(&:to_i)
  end

  private 

  # Validates the input string and raises an exception if it is invalid.
  # The input string is considered invalid if it contains ",\n" or "\n," or ends with "\n".
  def validate_input
    raise "Invalid string" if @input =~ /,\n|\n,|\A\n|\n\z/
  end
end
