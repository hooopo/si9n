# encoding: utf-8
module MineHelper   
            
  # highlight for current user mine tabs item
  def current_class_for_mine(action)
    if params[:controller] == "mine" && params[:action] == action
      "class='selected'"
    else
      ""
    end 
  end
end
