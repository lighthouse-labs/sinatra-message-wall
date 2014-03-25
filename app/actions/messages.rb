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

# Submit/Create a message on the wall
post '/messages' do
  @message = Message.new(
    title:   params[:title],
    content: params[:content],
    author:  params[:author]
  )
  @message.user = current_user

  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end
