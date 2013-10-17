require "./config/environment"
require 'open-uri'
 
namespace :cache do
  desc 'pre cache all versions'
  task :warm do
    API.versions.each do |version|
    	API.books(version.id).each do |book|
    		API.chapters(book.id).each do |chapter|
    			puts chapter.id
    		end
    	end
    	API.books_with_chapters(version.id).each do |book|
    		
    	end
    end
  end

  desc 'clear cache'
  task :clear do
    Rails.cache.clear
    dc = Dalli::Client.new
    dc.flush
  end
end
