require 'spec_helper'

describe "search" do 
	it "by keyword" do
		visit "/search/Jesus" 
		page.should have_content("Jesus")
	end



end
