require 'spec_helper'

describe "keyword search", vcr: true do

	it "displays passage text" do
		visit "/eng-CEV/search?q=love"
		page.should have_content("love")
	end
end

