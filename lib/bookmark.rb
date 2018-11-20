require 'pg'

class Bookmark
  attr_reader :url
  def initialize(url)
    @url = url
  end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end
end
