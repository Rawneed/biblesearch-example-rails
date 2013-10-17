class ChaptersController < ApplicationController
	caches_page :show

	def show
		@version = API.version(params[:version_uid]).value
		@api_chapter = API.chapter("#{params[:version_uid]}:#{params[:book_code]}.#{params[:chapter_number]}")
		@chapter = @api_chapter.value
		@fums = @api_chapter.fums
	end
end
	