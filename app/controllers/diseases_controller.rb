class DiseasesController < ApplicationController
  include DiseasesHelper

  def index
    # byebug
    @diseases_this_page = get_questions

  end

  def import
    # byebug
    user_id = session[:user_id]
  	choose = params[:choose]
  	reason = params[:reason]
    diseases = params[:dis]

    if choose == nil
      flash[:warning] = "No answer given!"
      redirect_to '/diseases'
      return
    end

    choose.keys.each do |d_id|
      dis = Disease.find_by_id(d_id)
      # byebug
      if choose_to_bool choose[d_id]
        num = dis.related
        dis.update!(related: num+1)
      else
        num = dis.unrelated
        dis.update!(unrelated: num+1)
      end
      Submission.create!({:disease_id => d_id, :user_id => user_id, :is_related => choose_to_bool(choose[d_id]), :reason => reason_to_index(reason[d_id])})
    end

    flash[:success] = "Successfully submitted #{choose.keys.size} questions."
    redirect_to '/diseases'
  end

  def temp
    #Submission.uniq.pluck(:disease_id)
    #rails generate migration add_related_to_diseases related:integer
  end
end
