require 'sinatra/base'
require_relative './lib/bookmark.rb'
require_relative './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/index")
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    @bookmark = Bookmark.find(id: params[:id])
    erb(:"bookmarks/edit")
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks/new' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
