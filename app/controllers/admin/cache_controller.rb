class Admin::CacheController < ApplicationController
	def index
		
	end


	def refresh
		Cache.clear_versions_api_cache(site_versions)
		Cache.clear_versions_page_cache(site_versions)
		Cache.warm_versions_api_cache(site_versions)
		redirect_to :action => "index"
	end
end