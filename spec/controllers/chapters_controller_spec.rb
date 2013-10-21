require 'spec_helper'

describe ChaptersController do
  before do
    VCR.insert_cassette %{controller-chapters}, record: :all
    @biblesearch = BibleSearch.new(BIBLESEARCH_API_KEY)
  end

  after do
    VCR.eject_cassette
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
