class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def reason_to_index(str)
	if str == "VISA"
		return 0
	elsif str == "MasterCard"
		return 1
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
