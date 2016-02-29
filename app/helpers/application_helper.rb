module ApplicationHelper
  def body_class
    if logged_in?
      'logged-in'
    else
      'not-logged-in'
    end
  end
end
