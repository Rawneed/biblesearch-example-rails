require 'spec_helper'

describe "view passage" do 
	it "displays passage text" do
		visit "/eng-CEV/passages?q=Gen%201:3-6" 
		page.should have_content("In the beginning")
	end



end
