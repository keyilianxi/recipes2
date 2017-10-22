class Admin::EventTicketsController < AdminController
  before_action :find_event

  def index
    @tickets = @event.tickets
  end

  def new
    @ticket = @event.tickets.new(ticket_params)
  end

  def create
    @ticket = @event.tickets.new(ticker_params)
    if @ticket.save
      redirect_to admin_event_tickets_path(@event)
    else
      render "new"
    end
  end

  def edit
    @ticket = @event.tickets.find(params[:id])
  end

  def update
    @ticket = @event.tickets.find([:id])
    if @ticket.update(ticket_params)
      redirect_to admin_event_tickets_path(@event)
    else
      render "edit"
    end
  end

  def destroy
    @ticket = @event.tickets.find([:id])
    @ticket.destroy
  end

  protected

  def find_event
    @event = Event.find(params[:event_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :price, :description)
  end


end
