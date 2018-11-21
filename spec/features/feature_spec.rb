require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "destroy")
    Bookmark.create(url: "http://www.google.com", title: "google")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
