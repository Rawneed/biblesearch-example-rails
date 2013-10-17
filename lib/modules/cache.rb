
module Cache
	include Rails.application.routes.url_helpers
	include ApplicationHelper
	
	def self.clear_versions_api_cache(versions)
		Rails.cache.clear
	end

	def self.clear_versions_page_cache(versions)
		versions.each do |version|
			patterns = []
			patterns << "#{ActionController::Base.page_cache_directory}/#{version.id}/**/*.html" 
			patterns << "#{ActionController::Base.page_cache_directory}/versions/*.html" 

			patterns.each do |pattern|
		    Dir.glob(pattern) do |filename|
		      File.delete(filename)
		    end
		  end
		end
	end

	def self.warm_versions_api_cache(versions)
		versions.each do |version|
			API.books(version.id).collection.each do |book|
				API.chapters(book.id).collection.each do |chapter|	
				end
			end
			API.books_with_chapters(version.id).collection.each do |book|
			end
		end
	end

end