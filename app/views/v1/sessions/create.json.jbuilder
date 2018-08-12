json.data do
  json.id @user.id
  json.email @user.email
  json.id_number @user.id_number
  json.name @user.name
  json.lastname @user.lastname
  json.position @user.position
  json.delegation @user.delegation
  json.contractor @user.contractor
  json.role @user.role
  json.phone @user.phone
  json.address @user.address

  if @user.errors.empty?
    json.jwt_token JWTWrapper.encode({ user_id: @user.id })
  else
    json.errors @user.errors
  end
end
