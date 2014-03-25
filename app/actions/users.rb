
get '/users' do
  # SELECT users.* FROM users ORDER BY users.message_count DESC
  @users = User.order('users.message_count DESC').all
  erb :'users/index'
end
