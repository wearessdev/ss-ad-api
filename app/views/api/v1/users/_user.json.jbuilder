# frozen_string_literal: true

json.id     user.id
json.name   user.name
json.email  user.email
json.auth   "token #{user.token.token}"

json.school do
  json.partial! "/api/v1/schools/school", school: user.school, short_version: true
end
