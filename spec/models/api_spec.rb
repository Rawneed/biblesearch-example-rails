#coding: utf-8
require 'spec_helper'

describe API do

  it %{includes chapters when fetching books} do
    genesis = API.books_with_chapters('eng-CEV').collection[0]
    # puts genesis
    genesis.chapters.collection.should have(50).chapters
  end

end
