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
  note = Note.find(params[:id])
  note.update_attributes(params)
end


get '/note/:id' do 
  @note = Note.find(params[:id])
  erb :view_note
end

get '/delete/:id' do 
  Note.delete(params[:id])
  redirect '/'
end 