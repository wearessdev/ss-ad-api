# frozen_string_literal: true

class Api::V1::EventsController < Api::BaseController
  before_action :set_event, except: %i[create index]

  # GET /events
  # GET /events.json
  def index
    @events = Kaminari.paginate_array(Event.all).page(params[:page]).per(8)
    @total_pages = @events.total_pages
  end

  # GET /events/1
  # GET /events/1.json
  def show; end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      render :show, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      render :show, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    if @event.destroy
      render :show, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def like
    @event.likes += 1
    @event.save
    render :feedback, status: :ok
  end

  def love
    @event.loves += 1
    @event.save
    render :feedback, status: :ok
  end

  def dislike
    @event.likes -= 1
    @event.save
    render :feedback, status: :ok
  end

  def dislove
    @event.loves -= 1
    @event.save
    render :feedback, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    id = params[:id] || params[:event_id]
    @event = Event.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.permit(:name, :school_id, :description, :date, :location, :like, :love)
  end
end
