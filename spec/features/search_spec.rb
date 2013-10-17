require 'spec_helper'

describe "keyword search" do 
	it "displays passage text" do
		visit "/eng-CEV/search?q=love" 
		page.should have_content("love")
	end
end

describe "passage search" do 
	it "displays passage text" do
		
	end
end
