# frozen_string_literal: true

class Api::V1::GamesController < Api::BaseController
  before_action :set_game, only: %i[show update destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Kaminari.paginate_array(Game.all).page(params[:page]).per(8)
    @total_pages = @games.total_pages
  end

  # GET /games/1
  # GET /games/1.json
  def show; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if @game.update(game_params)
      render :show, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.permit(:date, :opponent, :location, :home_away, :win, :loss, :score, :school_id, :team_id, :season_id)
  end
end
