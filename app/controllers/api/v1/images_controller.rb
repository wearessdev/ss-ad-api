# frozen_string_literal: true

class Api::V1::ImagesController < ApplicationController
  before_action :set_image, only: %i[show update destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show; end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    file = @image.convert_to_file(
      school_id: 1,
      name: params[:name],
      file: params[:file]
    )

    object = @image.article || @image.event

    object.images.attach(
      io: File.open(file[:path]),
      filename: file[:file_name]
    )

    @image.file = url_for(object.images.last)

    if @image.save
      render :show, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.permit(:name, :caption, :file, :article_id, :event_id)
  end
end
