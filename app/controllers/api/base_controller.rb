# frozen_string_literal: true

class Api::BaseController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  def authenticate_user
    return if request.headers['Authorization'] == ENV["PASS_KEY"]

    header = request.headers['Authorization']
    type = header.split(' ').first if header
    header = header.split(' ').last if header

    return render json: { error: "Not Authorized" }, status: :unauthorized if type != "token"

    begin
      @decoded = AuthService.decode(header)
      @user = User.find_by_email(@decoded[:user_email])
      @school = School.find(@decoded[:school_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
