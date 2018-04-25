module ApplicationHelper
     
 def resource_name
    :user
 end

  def resource_class 
     User 
  end

  def resource
    @resource ||= User.new
  end

  
end
