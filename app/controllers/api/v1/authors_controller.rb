class Api::V1::AuthorsController < Api::BaseController
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.where(school: @school)
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    if @author.save
      render :show, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    if @author.update(author_params)
      render :show, status: :ok, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name, :school_id)
    end
end
