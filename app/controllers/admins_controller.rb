class AdminsController < ApplicationController
  include AdminsHelper
  before_action :admin?

  def show
    # byebug

    if !params.has_key?(:search) && !params.has_key?(:sort)
      session.delete(:search) if session.has_key? :search
      session.delete(:sort) if session.has_key? :sort
    end

    if params.has_key? :search
      session[:search] = params[:search]
    end

    if params.has_key? :sort
      sort = params[:sort] # session[:sort] = ["id", true], where true => descending while false => ascending
      if session.has_key?(:sort) && session[:sort][0] == sort
        session[:sort][1] = !session[:sort][1]
      else
        session[:sort] = [sort, true]
      end
    end

    @diseases = find_conditional_diseases().paginate(per_page: 15, page: params[:page])

    if @diseases == nil
      flash[:warning] = "No Results!"
      redirect_to '/admin'
    end
  end



  def configuration
    user = User.find_by_id(session[:user_id])
    if !user || !user.admin?
      flash[:warning] = "Permission denied!"
      redirect_to root_path
      return
    end
  end

  def update
    user = User.find_by_id(session[:user_id])
    if !user || !user.admin?
      flash[:warning] = "Permission denied!"
      redirect_to root_path
      return
    end

    byebug
    str = params[:num_per_page]

    if str.size == 0 || (str =~ /^[-+]?\d+$/) == nil
      flash[:warning] = "Invalid input!"
      redirect_to '/config'
      return
    end

    new_value = params[:num_per_page].to_i

    if new_value < 5 || new_value > 20
      flash[:warning] = "Please enter a number in range (5..20)"
      redirect_to '/config'
      return
    end

    old_value = get_num_per_page
    set_num_per_page(new_value)
    flash[:success] = "Number of entries per page successfully switched from #{old_value} to #{new_value}"
    redirect_to '/config'
  end
end
