class VersionsController < ApplicationController
	caches_page :show

	def index
		#@api_versions = API.versions
		@versions = site_versions
		@fums = ""
		@version_langs = @versions.group_by { |v| "#{v.lang_name} - #{v.lang_name_eng}" }
	end

	def show
		@version = API.version(params[:version_uid]).value #biblesearch.version(params[:version_uid])
		@api_books = API.books_with_chapters(params[:version_uid])
		@books = @api_books.collection
		@fums = @api_books.fums
	end
end
