# frozen_string_literal:true

json.id @user.id
json.name @user.name
json.email @user.email
json.created_at @user.created_at
json.updated_at @user.updated_at

json.auth_token @user.token.token
