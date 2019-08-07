class Api::BaseController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user, only: %i[update]
  before_action :set_school

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = AuthService.decode(header)
      @user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def set_school
    @school = School.find(params[:school_key])
  end
end
