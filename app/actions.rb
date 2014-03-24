# Homepage (Root path)
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

get '/signup' do
  erb :'auth/signup'
end

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
