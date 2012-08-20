module RVsHelper
  def get_title(rv)
    rv.year.to_s() << " " << rv.make << " " << rv.model
  end
end
