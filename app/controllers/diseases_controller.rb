class DiseasesController < ApplicationController
  def index
   #@diseases = Disease.all
   $i = 0
   $num = 5
   #r = Random.new
   @dis = []

   while $i < $num do
   	#r.rand(1...19732)
   	arr = Disease.find(rand(1...19732))
    
   	@dis.push(arr)
   	$i += 1
   end

  end

  def import
    Disease.import(params[:file])
    redirect_to root_url, notice: "Activity Data Imported"
  end
end
