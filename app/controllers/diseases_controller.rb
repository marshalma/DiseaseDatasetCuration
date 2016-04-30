class DiseasesController < ApplicationController

@@dis = []


  def index
    # byebug
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
  	$user_id = session[:user_id]

    @dis = @@dis
    @arr = []

    if choose == nil
      flash[:error] = "No answer given!"
      redirect_to diseases_index_path
      return
    end

    choose.keys.each do |key_choose|
    	$i = 0
    	# binding.pry
    	while $i < @dis.size do
    		if (key_choose == @dis.at($i).id.to_s)
    			@arr << @dis.at($i).id
    			@arr << $user_id
    			@arr << choose_to_bool(choose[key_choose])
    			@arr << reason_to_index(reason[key_choose])
    		end
    		$i += 1
    	end
    end

	Submission.insert(@arr)
  end
end
