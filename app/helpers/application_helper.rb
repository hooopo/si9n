module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    # #重复了？？？
    @current_user ||= User.find_by_id(cookies.signed[:user_id])
  end

  def current_user= (user)
    @current_user = user
  end

  def parent_layout(layout)
    @_content_for[:layout] = self.output_buffer
    self.output_buffer = render(:file => "layouts/#{layout}")
  end
  
end