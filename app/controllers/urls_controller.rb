class UrlsController < ApplicationController
    def index
        @urls = Url.all
        @url = Url.new
    end

    def show
    	@url = Url.find(params[:id])
	end

	def new
  		@url = Url.new	
	end

	def create
	  @url = Url.new(url_params)
	  @url.shorten

	  if @url.save
	      redirect_to urls_path  
	  else
	  	  url_params = nil
	  	  @errors = @url.errors.full_messages
	      render :new
	  end   
	end

	# def errors
	# 	@errors = @url.errors.full_messages
	# end	

	def destroy
	    @url = Url.find(params[:id])
	    @url.destroy
	    redirect_to urls_path
	end

	private 
	def url_params
	    params.require(:url).permit(:long_url)
	end

end
