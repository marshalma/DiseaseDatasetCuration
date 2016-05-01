class AdminsController < ApplicationController
  include AdminsHelper

  def show
    # byebug
    user = User.find_by_id(session[:user_id])
    if !user || !user.admin?
      flash[:warning] = "Permission denied!"
      redirect_to root_path
      return
    end

    @diseases = Disease.paginate(per_page: 15, page: params[:page])

  end

  def query
    byebug
    render 'admin/show'
  end

  def configuration
  end

  def update
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
    flash[:success] = "Number of items per page successfully switched from #{old_value} to #{new_value}"
    redirect_to '/config'
  end
end
