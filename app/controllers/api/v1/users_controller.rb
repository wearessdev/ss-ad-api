# frozen_string_literal: true

class Api::V1::UsersController < Api::BaseController
  before_action :set_user, only: %i[show update destroy]
  skip_before_action :authenticate_user, only: %i[create show index]

  # GET /users
  def index
    @users = User.all

    # render json: @users
  end

  # GET /users/1
  def show; end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.token = Token.new.new_token(@user, AuthService.new(@user).encode)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
