class EventsController < ApplicationController
  def index
    skip_authorization
  end

  def new
    skip_authorization
    @event = Event.new
  end

  def create
    skip_authorization

    @event = Event.new(event_params)
    @event.organizer = User.find_by(email: params[:organizer_email])

    if @event.save
      redirect_to events_path
    else
      render :new
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
