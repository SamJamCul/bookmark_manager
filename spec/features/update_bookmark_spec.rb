feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Update'

    fill_in('title').with("Michaels Academy")
    fill_in('url').with("http://www.michaelsacademy.com")
    click_button('Update')

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Michaels Academy', href: 'http://www.michaelsacademy.com')
  end
end
