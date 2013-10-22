require 'spec_helper'

describe "list versions", vcr: true do
	it "displays version titles" do
		visit "/versions"
		page.should have_content("Contemporary English Version")
	end
end

describe "show version", vcr: true do
	it "displays version" do
		visit "/versions/eng-CEV"
		page.should have_content("Contemporary English Version")
	end
end
