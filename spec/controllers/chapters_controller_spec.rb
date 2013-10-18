require 'spec_helper'

describe ChaptersController do

  it %{displays footnotes} do
    get :show, {version_uid: 'eng-CEV', book_code: 'Gen', chapter_number: '26'}
    assigns.should include(:footnotes)
  end
  it %{displays cross-references} do
    get :show, {version_uid: 'eng-CEV', book_code: 'Gen', chapter_number: '26'}
    assigns.should include(:xrefs)
  end

end
