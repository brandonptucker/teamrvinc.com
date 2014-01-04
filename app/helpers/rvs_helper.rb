module RVsHelper
  
  def get_title(rv)
    rv.year.to_s() << " " << rv.make << " " << rv.model
  end
  
  def get_class_for_color(color)
  	case color
  	when "Green"
  		"label-success"
  	when "Yellow"
  		"label-warning"
  	when "Red"
  		"label-important"
  	when "Blue"
  		"label-info"
  	when "Black"
  		"label-inverse"
  	else
  		""
  	end
  end
end
