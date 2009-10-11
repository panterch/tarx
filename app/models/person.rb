class Person < ActiveRecord::Base

  acts_as_tree

  def display_name
    "#{code} / #{name}"
  end

  # limited sibling lookup
  def near_siblings
    siblings[0..1]
  end

  def to_param
    (!code.blank? && code) || (id && id.to_s)
  end


end
