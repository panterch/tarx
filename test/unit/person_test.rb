require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "Person Factory" do
    assert_difference "Person.count" do
      Factory(:person)
    end
  end

  test "Parent Query" do
    parent = Factory(:person)
    child =  Factory(:person, :parent => parent)
    assert_equal parent, child.reload.parent
  end

  test "Children Query" do
    parent = Factory(:person)
    (1..3).each { Factory(:person, :parent => parent) }
    assert_equal 3, parent.children.count
  end

  test "Near Sibling with too much siblings" do
    parent = Factory(:person)
    child = Factory(:person, :parent => parent)
    (1..5).each { Factory(:person, :parent => parent) }
    assert_equal 2, child.near_siblings.length
  end

  test "Near Sibling with no siblings" do
    parent = Factory(:person)
    child = Factory(:person, :parent => parent)
    assert_equal 0, child.near_siblings.length
  end

  test "Near Sibling with no parent" do
    parent = Factory(:person)
    assert_equal 0, parent.near_siblings.length
  end


end
