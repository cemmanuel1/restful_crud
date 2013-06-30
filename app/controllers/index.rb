get '/' do
  # if logged_in?
  #   redirect "/user/posts"
  # else
    erb :index
  # end
end

get "/user/new" do
  @user = User.new
  erb :user_form
end

post "/user/create" do
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect "/user/dashboard"
  else
    erb :user_form
  end
end
