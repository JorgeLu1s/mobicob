json.data do
  json.id @user.id.to_i
  json.email @user.email.to_s
  json.id_number @user.id_number.to_i
  json.name @user.name.to_s
  json.lastname @user.lastname.to_s
  json.position @user.position.to_s
  json.phone @user.phone.to_s
  json.address @user.address.to_s

  if @user.errors.empty?
    json.jwt_token JWTWrapper.encode({ user_id: @user.id })
  else
    json.errors @user.errors
  end
end
