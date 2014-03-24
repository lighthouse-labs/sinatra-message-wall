# Homepage (Root path)

helpers do
  # Usable in ERB templates everywhere, and in any action below
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end

post '/messages' do
  @message = Message.new(
    title:   params[:title],
    content: params[:content],
    author:  params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

### AUTHENTICATION ACTIONS

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
