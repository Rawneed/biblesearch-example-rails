require 'spec_helper'

describe "list versions" do
	it "displays version titles" do
		visit "/versions"
		page.should have_content("Contemporary English Version")
	end
end

describe "show version" do
	it "displays version" do
		visit "/versions/eng-CEVD"
		page.should have_content("Contemporary English Version")
	end
end