# frozen_string_literal: true

class Api::V1::StaffsController < Api::BaseController
  before_action :set_staff, only: %i[show update destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show; end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      render :show, status: :created, location: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    if @staff.update(staff_params)
      render :show, status: :ok, location: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def staff_params
    params.permit(:first_name, :last_name, :title, :email, :phone)
  end
end
