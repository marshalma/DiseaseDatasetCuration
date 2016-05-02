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

  def update_session(page, search, sort)
    # byebug
    if !params.has_key?(page)
      if !params.has_key?(search) && !params.has_key?(sort)
        session.delete(search) if session.has_key? search
        session.delete(sort) if session.has_key? sort
      end

      if params.has_key? search
        session[search] = params[search]
      end

      if params.has_key? sort
        _sort = params[sort] # session[sort] = ["id", true], where true => descending while false => ascending
        if session.has_key?(sort) && session[sort][0] == _sort
          session[sort][1] = !session[sort][1]
        else
          session[sort] = [_sort, true]
        end
      end
    end
  end

end
