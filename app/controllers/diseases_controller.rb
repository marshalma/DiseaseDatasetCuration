class DiseasesController < ApplicationController
  def index
    # byebug
    num_per_page = 5
    @diseases_this_page = []

    (0..num_per_page-1).each do
    	arr = Disease.find(rand(1...Disease.count))
     	@diseases_this_page << arr
    end
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
      Submission.create!({:disease_id => d_id, :user_id => user_id, :is_related => choose[d_id], :reason => reason[d_id]})
    end

    flash[:success] = "Successfully submitted #{choose.keys.size} questions."
    redirect_to '/diseases'
  end
end
