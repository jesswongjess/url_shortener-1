class UrlsController < ApplicationController

    def index
        @urls = Url.all
        @url = Url.new
    end

	def new		
  	    @url = Url.new(url_params)
	end

	def create
	  @url = Url.new(url_params)
	  @url.shorten

	  if @url.save
	      redirect_to urls_path
	  else  
	  	  @errors = @url.errors.full_messages
	      render :new
	  end   

	end

	# def errors
	# 	@errors = @url.errors.full_messages
	# end	

	private 
	def url_params
	    params.require(:url).permit(:long_url, :short_url)
	end

end
