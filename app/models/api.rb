class API
  extend ActiveModel::Naming

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def self.versions(options={})
    Rails.cache.fetch([:versions],options) do
      biblesearch.versions(options)
    end
  end

  def self.version(version_uid)
    Rails.cache.fetch([:versions,version_uid]) do
      biblesearch.version(version_uid)
    end
  end

  def self.books(version_uid)
    Rails.cache.fetch([:books,version_uid]) do
      biblesearch.books(version_uid)
    end
  end

  def self.books_with_chapters(version_uid)
    Rails.cache.fetch([:books_with_chapters,version_uid]) do
      biblesearch.books(version_uid, include_chapters: true)
    end
  end

#TODO: refactor to book
  def self.books(book_uid)
    Rails.cache.fetch([:book,book_uid]) do
      biblesearch.books(book_uid)
    end
  end

  def self.chapters(book_uid)
    Rails.cache.fetch([:chapters,book_uid]) do
      biblesearch.chapters(book_uid)
    end
  end

  def self.chapter(chapter_uid)
    Rails.cache.fetch([:chapter,chapter_uid]) do
      biblesearch.chapter chapter_uid, include_marginalia: true
    end
  end

  def self.verse(verse_uid)
    Rails.cache.fetch([:verse,verse_uid]) do
      biblesearch.verse verse_uid, include_marginalia: true
    end
  end

  def self.search(query,options={})
    Rails.cache.fetch([:search,query,options]) do
      biblesearch.search(query,options)
    end
  end

  def self.passages(query,options={})
    Rails.cache.fetch([:passages,query,options]) do
      biblesearch.passages(query,options)
    end
  end

private

  def self.biblesearch
    @biblesearch ||= BibleSearch.new(ENV["BIBLESEARCH_API_KEY"])
  end

end
