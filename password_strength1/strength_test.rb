require 'minitest/autorun'
require_relative 'strength.rb'

class StrengthTest < Minitest::Test
  def test_item_creation
    strength = Strength.new
    assert_instance_of Strength, strength
  end

  def test_password
    password_strength = Strength.password('test')
    assert password_strength
  end

  def test_weak_password
    weak1 = Strength.password('test')
    weak2 = Strength.password('1234')
    weak3 = Strength.password('testingalicousness')
    assert([weak1, weak2, weak3].none? { |p| p[:weak] == false })
    strong = Strength.password('testing123')
    assert strong[:weak] == false
  end

  def test_weak_returns_nil_medium
    weak1 = Strength.password('test')
    assert_nil weak1[:medium]
  end

  def test_not_weak_returns_medium
    medium = Strength.password('test1234')
    assert medium[:medium]
    assert_nil medium[:strong]
  end

  def test_not_medium_returns_strong
    strong = Strength.password('test1234!')
    assert strong[:strong]
  end

  def test_not_strong_returns_very_strong
    very_strong = Strength.password('testing1234!')
    assert very_strong[:very_strong]
  end

  def test_variety
    test1 = Strength.password('12345678912345')
    expected = { weak: false, medium: true, strong: nil, very_strong: nil }
    assert_equal expected, test1
    test2 = Strength.password('1!!!!!!!!!!!')
    expected = { weak: false, medium: false, strong: false, very_strong: true }
    assert_equal expected, test2
    test3 = Strength.password('11111111111!')
    expected = { weak: false, medium: false, strong: false, very_strong: true }
    assert_equal expected, test3
  end
end
