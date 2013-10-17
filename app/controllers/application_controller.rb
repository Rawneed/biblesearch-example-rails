class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_version, :site_versions
	before_filter :set_current_version
	
	def current_version
		if params[:version_uid]
			@current_version ||= site_versions.select {|v| v.id == params[:version_uid]}.first
		elsif session[:current_version_id]
			@current_version ||= site_versions.select {|v| v.id == session[:current_version_id]}.first
		else
			@current_version ||= site_versions.select {|v| v.id == ENV['DEFAULT_VERSION']}.first
		end
		@current_version = site_versions.first if @current_version.nil?
		@current_version
	end

	def site_versions
		@site_versions ||= API.versions({expire_in: 1.day}).collection.keep_if{|v| ENV['SITE_VERSIONS'].include?(v.id)}
	end

	def set_current_version
		if params[:version_uid]
			session[:current_version_id] = params[:version_uid]
		end
	end

end
