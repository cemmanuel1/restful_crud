get '/' do
@notes = Note.all
    erb :index
end

get '/create' do 
  erb :create_note
end

post '/create' do 
  Note.create(params)
  redirect '/'
end


get '/update/:id' do 
  @note = Note.find(params[:id])
  erb :update_note
end

post '/update/:id' do 
  @note = Note.find(params[:id])
  @note.update_attributes(params[:note])
  redirect '/'
end


get '/note/:id' do 
  @note = Note.find(params[:id])
  erb :view_note
end

delete '/:id' do 
  @note = Note.find(params[:id])  
  @note.destroy  
  redirect '/'  
end 
