class VersesController < ApplicationController
	def show
		@version = API.version(params[:version_uid])
		@api_verse = API.verse("#{params[:version_uid]}:#{params[:book_code]}.#{params[:chapter_number]}.#{params[:verse_number]}")
		@verse = @api_verse.value
		@fums = @api_verse.fums
	end
end
