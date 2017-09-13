class UrlsController < ApplicationController
	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(url_params)
		@url.short
		
		if @url.save
			redirect_to @url
		else
			render 'new'
		end
	end

	def show
	
		@url = Url.find(params[:id])
	end

	def url_params
		params.require(:url).permit(:long_url)
	end
end
