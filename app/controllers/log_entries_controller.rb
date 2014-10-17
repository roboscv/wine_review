class LogEntriesController < ApplicationController
before_action :set_wine

	def new
  	@log_entry = @wine.log_entries.new
	end

	def create
  		@log_entry = @wine.log_entries.new(log_entry_params)
  		if @log_entry.save
  	  redirect_to wine_log_entries_path(@wine), notice: 'Log Entry saved!'
 	 else
   		 render :new
	  end
	end



def index
  @log_entrys = @wine.log_entries.order('created_at desc')
end

private

def set_wine
  @wine = Wine.find(params[:wine_id])
end

def review_params
  params.require(:log_entry).permit(:name, :rating, :location, :comments, :tasted_on)
end


end
