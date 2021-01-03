require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'SampleTest', description: 'SampleTest')
  end

  test 'valid category' do
    assert @category.valid?
  end
  
  test "Category.create with the params should work" do
    @category = Category.create(name: 'SampleTest', description: "SampleTest")
    assert :success
  end

  test 'invalid without name' do
    @category.name = nil
    refute @category.valid?, 'category is valid without name'
    assert_not_nil @category.errors[:name], 'no validation error for name present'
  end

  test 'invalid without description' do
    @category.description = nil
    refute @category.valid?
    assert_not_nil @category.errors[:email]
  end

end
