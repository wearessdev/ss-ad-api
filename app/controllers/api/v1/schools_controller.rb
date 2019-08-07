class Api::V1::SchoolsController < Api::BaseController
  before_action :set_school, only: %i[show update destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show; end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    if @school.save
      render :create, status: :created
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    if @school.update(school_params)
      render :show, status: :ok, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.permit(:name, :city, :state, :zip, :address)
  end
end
