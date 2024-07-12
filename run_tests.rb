# run_tests.rb

require 'minitest/autorun'
Dir.glob('./**/*_test.rb').each { |file| require file }
