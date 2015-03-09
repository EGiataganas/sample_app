module ApplicationHelper

  #Retunrn a title on a per-page basics.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
end
