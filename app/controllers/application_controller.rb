
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do
    redirect to "/articles"
  end

  #ERB index
  get '/articles' do 
    @articles = Article.all
  
    erb :index
  end

  #ERB new
  get '/articles/new' do
     @article = Article.new
  
    erb :new
  end

  #CREATE
  post '/articles' do
    @article = Article.create(params)

    redirect to "/articles/#{ @article.id }"
  end

  #ERB show
  get '/articles/:id' do 
    @article = Article.find(params[:id])

    erb :show
  end

  #ERB Edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])

    erb :edit
  end

  #UPDATE
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])

    redirect to "/articles/#{ @article.id }"
  end

  #DELETE
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

  
end
