class PeopleController < ApplicationController

  resource_controller

  index.wants.html { redirect_to Person.first }

  def object
    return nil if param.nil?
    return @object unless @object.nil?
    if /^\d+$/ =~ param
      return @object = Person.find(param)
    end
    @object = Person.find_by_code(param)
    raise ActiveRecord::RecordNotFound unless @object
    @object
  end

end
