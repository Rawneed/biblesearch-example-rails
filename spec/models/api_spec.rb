#coding: utf-8
require 'spec_helper'

describe API do

  it %{includes chapters when fetching books} do
    genesis = API.books('eng-CEV').collection[0]
    # puts genesis
    genesis.keys.should include("chapters")
  end

end
