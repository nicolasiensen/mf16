class EventsController < ApplicationController
  def index
    skip_authorization
    @events = Event.order(start_at: "desc")
  end

  def new
    authorize Event
    @event = Event.new
  end

  def create
    authorize Event

    @event = Event.new(event_params)
    @event.organizer = User.find_by(email: params[:organizer_email])

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    authorize Event
    @event = Event.find(params[:id])
  end

  def update
    authorize Event
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to events_path, notice: "Evento atualizado!"
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :category,
      :short_description,
      :long_description,
      :address,
      :start_at,
      :facebook_link,
      :google_calendar_link,
      :has_streaming
    )
  end
end
