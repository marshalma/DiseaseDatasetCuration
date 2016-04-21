class DiseasesController < ApplicationController

require 'pry'

@@dis = []

  def index
   #@diseases = Disease.all
   $i = 0
   $num = 5
   @dis = @@dis

   while $i < $num do
   	arr = Disease.find(rand(1...19732))
   	@dis.push(arr)
   	$i += 1
   end
  end

  def import
    yes = params[:yes]
    no = params[:no]
    @dis = @@dis
    @arr = []
    
    yes.keys.each do |key_yes|
    	$i = 0
    	while $i < @dis.size do
    		if (key_yes == @dis.at($i).disease)
    			@arr.push(@dis.at($i).id)
    			@arr.push(yes[key_yes])
    		end

    		$i += 1
    	end
    end
    
	Answer.insert(@arr)
    
  end
end
