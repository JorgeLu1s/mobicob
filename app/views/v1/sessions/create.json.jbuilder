json.data do
  json.id @user.id.to_i
  json.email @user.email.to_s
  json.id_number @user.id_number.to_i
  json.name @user.name.to_s
  json.lastname @user.lastname.to_s
  json.position @user.position.to_s
  json.phone @user.phone.to_s
  json.address @user.address.to_s

  json.delegation do
    json.id @user.delegation.id
    json.code @user.delegation.code
    json.name @user.delegation.name
  end

  json.contractor do
    json.id @user.contractor.id
    json.code @user.contractor.code
    json.name @user.contractor.name
  end

  json.role do
    json.id @user.role.id
    json.code @user.role.code
    json.name @user.role.name
  end

  if @user.errors.empty?
    json.jwt_token JWTWrapper.encode({ user_id: @user.id })
  else
    json.errors @user.errors
  end
end
