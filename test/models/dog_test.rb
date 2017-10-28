require 'test_helper'

class DogTest < ActiveSupport::TestCase
  test "create dog" do
    dog = Dog.new
    assert_not_nil dog, "New dog is nil"
  end
  
  test "save dog" do
    dog = Dog.new
    assert_not_nil dog, "New dog is nil"
    assert_not dog.save, "Save dog"
  end
  
  test "dog parameters" do
    dog = Dog.new(name: "Fido", breed: "Bassethound", age: 2.5, sex: "male", desexed: true)
    assert_not_nil dog, "New dog is nil"
    assert_equal "Fido", dog.name, "dog name"
    assert_equal "Bassethound", dog.breed, "dog breed"
    assert_equal 2.5, dog.age, "dog age"
    assert_equal "male", dog.sex, "dog sex"
    assert dog.desexed, "dog desexed"
  end
end
