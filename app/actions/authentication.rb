
# Form
get '/login' do
  erb :'auth/login'
end

# Form
get '/signup' do
  erb :'auth/signup'
end

post '/login' do
  # @user = User.where(email: params[:email], password: params[:password]).first
  #
  # @user = User.where("users.email = ? AND users.password=?", params[:email], params[:password]).first

  @user = User.find_by(email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/login'
  end
end

# Form Submission
post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/signup'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end
