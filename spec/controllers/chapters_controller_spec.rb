require 'spec_helper'

describe ChaptersController, vcr: true do
  before do
    @biblesearch = BibleSearch.new(BIBLESEARCH_API_KEY)
  end

  it %{displays footnotes} do
    get :show, {version_uid: 'eng-CEV', book_code: 'Gen', chapter_number: '26'}
    assigns['chapter'].should include('footnotes')
  end

  it %{displays cross-references} do
    get :show, {version_uid: 'eng-CEV', book_code: 'Gen', chapter_number: '26'}
    assigns['chapter'].should include('crossreferences')
  end

end
