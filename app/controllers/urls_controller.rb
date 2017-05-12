class UrlsController < ApplicationController
	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(long_url:params[:url][:long_url],short_url:SecureRandom.hex(4))
		if @url.save
			redirect_to urls_path, notice:"Your url have been added."
		else 
			@errors = "#{@url.errors.full_messages.join(". ")}"
			render "urls/new"
		end
	end

	# private
	# def url_params
	# 	params.require(:url).permit(:long_url,:short_url)
	# end
end
