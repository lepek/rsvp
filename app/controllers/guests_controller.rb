class GuestsController < ApplicationController
  def index
  end

  def create
    @guest = MainGuest.find_by_email(params[:guest_email])
    if @guest
      cookies.encrypted[:guest_email] = @guest.email
      redirect_to controller: 'confirmations', action: 'index'
    else
      session.delete(:guest_email)
      flash[:notice] = "No estas invitado!"
      render :index
    end
  end

end