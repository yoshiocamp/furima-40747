class ApplicationController < ActionController::Base
  before_action :basic_auth

def new
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to root_path
  else
    render 'new'
  end
end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  
    end
  end

end
