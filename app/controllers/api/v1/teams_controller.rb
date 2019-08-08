# frozen_string_literal: true

class Api::V1::TeamsController < Api::BaseController
  before_action :set_team, only: %i[show update destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show; end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    if @team.save
      render :show, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if @team.update(team_params)
      render :show, status: :ok
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    if @team.destroy
      render :show, status: :ok
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    id = params[:id] || params[:team_id]
    @team = Team.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.permit(:name, :thumbnail, :twitter_url, :facebook_url, :instagram_url)
  end
end
