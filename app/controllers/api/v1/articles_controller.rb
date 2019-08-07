# frozen_string_literal: true

class Api::V1::ArticlesController < Api::BaseController
  before_action :set_article, except: %i[create]

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
      render :show, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      render :show, status: :ok, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
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
    @article = Article.find(params[:article_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.fetch(:article, {})
  end
end
