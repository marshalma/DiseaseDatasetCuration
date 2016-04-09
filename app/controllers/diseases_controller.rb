class DiseasesController < ApplicationController
  def index
    @diseases = Disease.all
  end

  def import
    Disease.import(params[:file])
    redirect_to root_url, notice: "Activity Data Imported"
  end
end
