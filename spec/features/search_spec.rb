require 'spec_helper'

describe "search" do

  use_vcr_cassette

  it "by keyword" do
    visit "/search/Jesus"
    page.should have_content("Jesus")
  end

end

describe "keyword search" do

  use_vcr_cassette

	it "displays passage text" do
		visit "/eng-CEV/search?q=love"
		page.should have_content("love")
	end
end

describe "passage search" do

  use_vcr_cassette

	it "displays passage text" do

	end
end
