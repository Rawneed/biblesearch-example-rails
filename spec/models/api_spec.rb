#coding: utf-8
require 'spec_helper'

describe API, vcr: true do

  it %{includes chapters when fetching books} do
    genesis = API.books_with_chapters('eng-CEV').collection[0]
    genesis.chapters.should have(50).chapters
  end

end
