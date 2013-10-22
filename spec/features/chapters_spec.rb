require 'spec_helper'

describe "view chapter", vcr: true do

	it "displays chapter text" do
		visit "/eng-CEV/Gen/1"
		page.should have_content("In the beginning")
	end

	it "displays next chapter if it exists" do
		visit "/eng-CEV/Gen/1"
    first(:css, '[href*="/Gen/2"]').click
		current_path.should eq("/eng-CEV/Gen/2")
	end

	it "displays book name and chapter" do
		visit "/eng-CEV/Gen/1"
		page.should have_selector("#chapter.title", :text => /Genesis\s+1/)
	end

end
