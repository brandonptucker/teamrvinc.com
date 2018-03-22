module ApplicationHelper
  def nav_li_class(path)
      if current_page?(path)
        "active"
      end
  end
end
