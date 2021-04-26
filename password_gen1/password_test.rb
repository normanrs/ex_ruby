require 'minitest/autorun'
require_relative 'gen.rb'

class GenTest < Minitest::Test

  def setup
    @init_hash = {
      characters: 1,
      special_characters: 1,
      uppercase_letters: 1,
      lowercase_letters: 1,
      digits: 1
    }
    @alt_hash = {
      characters: 2,
      special_characters: 2,
      uppercase_letters: 2,
      lowercase_letters: 2,
      digits: 2
    }
  end

  def test_item_creation
    gen = Gen.new({})
    assert_instance_of Gen, gen
    assert_equal 0, gen.characters
    assert_equal 0, gen.special_characters
    assert_equal 0, gen.uppercase_letters
    assert_equal 0, gen.lowercase_letters
    assert_equal 0, gen.digits
    assert_equal '', gen.password
  end

  def test_item_creation_with_data
    gen = Gen.new(@init_hash)
    assert_instance_of Gen, gen
    assert_equal 1, gen.characters
    assert_equal 1, gen.special_characters
    assert_equal 1, gen.uppercase_letters
    assert_equal 1, gen.lowercase_letters
    assert_equal 1, gen.digits
    assert_instance_of String, gen.password
    puts gen.password
  end

  def test_item_creation_with_higher_numbers
    gen = Gen.new(@alt_hash)
    assert_instance_of Gen, gen
    assert_equal 8, gen.password.length
    puts gen.password
  end

end
