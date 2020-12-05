class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end 

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes' do 
    r = Recipe.create(params)
    redirect "/recipes/#{r.id}"
  end

  patch '/recipes/:id' do 
    r = Recipe.find(params[:id])
    r.update(params[:recipe])
  
    redirect "/recipes/#{r.id}"
  end

  delete '/recipes/:id' do
    r = Recipe.find(params[:id])
    r.destroy

    redirect '/recipes'
  end

end
