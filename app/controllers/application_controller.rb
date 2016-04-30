class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper 

  def reason_to_index(str)
	 if str == "Comprehensive"
		return 0
	 elsif str == "Irrelevant Study"
		return 1
   elsif str == "Not Enough Experiment"
    return 2
   elsif str == "No health Control"
    return 3
   elsif str == "Micro rna"
    return 4
   elsif str == "Biomarker"
    return 5
   elsif str == "Other"
    return 6
	end
  end

  def choose_to_bool(str)
  	if str == "1"
  		return true
  	else
  		return false
  	end
  end

end
