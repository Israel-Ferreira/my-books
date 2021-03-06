module ApplicationHelper
  def attr_name(object, attribute)
    if defined? object.human_attribute_name(attribute)
      object.human_attribute_name(attribute)
    else
      object.class.human_attribute_name(attribute)
    end
  end

  def obj_name(obj)
    obj.model_name.human(count: obj.count)
  end
end
