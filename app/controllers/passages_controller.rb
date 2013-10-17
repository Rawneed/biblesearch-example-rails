class PassagesController < ApplicationController
	
	def show
		@passages = API.passages(params[:q], {:versions=>params[:version_uid]})
		@copyrights = @passages.collect(&:copyright).uniq
	end

end
