class DiseasesController < ApplicationController

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

   while @dis.length > 5 do
   	@dis.shift
   end
  end

  def import
  	choose = params[:choose]
  	reason = params[:reason]
    id = params[:session][:id]

    binding.pry

    @dis = @@dis
    @arr = []

    choose.keys.each do |key_choose|

    	$i = 0
    	while $i < @dis.size do
    		if (key_choose == @dis.at($i).disease)
    			@arr << @dis.at($i).id
    			@arr << @dis.at($i).id
    			@arr << choose[key_choose]
    			@arr << reason[key_choose]
    		end

    		$i += 1
    	end
    end

	Submission.insert(@arr)

  end
end
