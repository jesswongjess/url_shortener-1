class UrlsController < ApplicationController

    def index
        @urls = Url.all
        @url = Url.new
    end

	def new		
  	    @url = Url.new
	end

	def create	
	  @url = Url.new(long_url: params[:url][:long_url]) #if @url.valid?
	  @url.shorten

	  if @url.save && @url.valid?
	      redirect_to urls_path
	  else  
	  	  @errors = @url.errors.full_messages
	      render :new
	  end   

	end

	def short
	    url = Url.find(params[:id])
	    redirect_to url.long_url    
	end 

	# private 
	# def url_params
 #        #params = ActionController::Parameters.new(long_url)
	#     params.require(:url).permit(:long_url) if params[:url]
	# end

end
