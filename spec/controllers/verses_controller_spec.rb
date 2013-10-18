require 'spec_helper'

describe VersesController do

  it %{displays footnotes} do
    get :show, {version_uid: 'eng-CEV', book_code: 'Gen', chapter_number: 26, verse_number: 1}
    assigns['verse'].should include('footnotes')
  end

  it %{displays cross-references} do
    get :show, {version_uid: 'eng-CEV', book_code: 'Gen', chapter_number: 26, verse_number: 1}
    assigns['verse'].should include('crossreferences')
  end


end
