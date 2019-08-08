# frozen_string_literal: true

class Api::V1::ArticlesController < Api::BaseController
  before_action :set_article, except: %i[create index]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show; end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      render :show, status: :created, format: :json
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      render :show, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.destroy
      render :show, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def like
    @article.likes += 1
    @article.save
  end

  def love
    @article.loves += 1
    @article.save
  end

  def dislike
    @article.likes -= 1
    @article.save
  end

  def dislove
    @article.loves -= 1
    @article.save
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    id = params[:id] || params[:article_id]
    @article = Article.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.permit(:name, :content, :is_published, :publish_date, :thumbnail, :school_id, :author_id)
  end
end
