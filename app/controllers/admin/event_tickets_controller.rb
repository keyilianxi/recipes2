class Admin::EventTicketsController < AdminController
  before_action :find_event

  def index
    @tickets = @event.tickets
  end

  
end
