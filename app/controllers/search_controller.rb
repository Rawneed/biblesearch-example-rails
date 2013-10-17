class SearchController < ApplicationController
	before_filter :set_version

	def show
		if params[:q]
			@api_search = API.search(params[:q], {:version=>params[:version_uid]})
			@result = @api_search.value
			@fums = @api_search.fums
			
			if @result.type == "passages" && @result.passages.kind_of?(Array) == false
				passage = @result.passages
				@result.passages = []
				@result.passages.push passage
			end

			if @result.type == "passages"
				@copyrights = @result.passages.collect(&:copyright).uniq.join("<br/>")
			else @result.type == "verses"
				@result.verses.compact!
				@copyrights = @result.verses.collect(&:copyright).uniq.join("<br/>")
			end

		end
	end


	private

	def set_version
		unless params[:version_uid]
			redirect_to search_url(ENV['DEFAULT_VERSION'])
		end
	end

end
