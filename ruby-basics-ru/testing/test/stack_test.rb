# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @initial_array = [1, 2, 3]
    @stack = Stack.new @initial_array.dup
  end

  def test_push!
    assert @stack.push!(@stack.to_a.max + 1).size == @initial_array.size + 1
  end

  def test_pop!
    @stack.pop!
    assert @stack.size == @initial_array.size - 1
  end

  def test_clear!
    assert @stack.clear!.empty?
  end

  def test_empty?
    refute @stack.empty? == true
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
