class ApiController < ActionController::API
  layout false

  before_action :authenticate_user!
end
