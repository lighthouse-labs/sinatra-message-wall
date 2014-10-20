# Homepage (Root path)
get '/' do
  session[:user] = 'KV'
  erb :index # render
end

get '/signin' do
  erb :signin
end

post '/signin' do
  session[:user] = params[:users_name]
  redirect '/messages'
end

# Example of a simple action that doesnt leverage ERB
get '/yo/:name' do
  name = params[:name]
  "<html><body><p>hey there, #{name.upcase}</p></body></html>"
end

get '/messages' do

  @messages = Message.order(upvotes: :desc)
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

post '/messages/:message_id/upvotes' do
  @message = Message.find(params[:message_id])
  @message.upvotes ||= 0
  @message.upvotes += 1
  # @upvote = @message.upvotes.new(user: current_user)
  @message.save
  redirect '/messages'
end
