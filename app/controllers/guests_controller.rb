class GuestsController < ApplicationController
  def index
  end

  def create
    @guest = MainGuest.find_by_email(params[:guest_email])
    if @guest && !@guest.invitations.empty?
      redirect_to controller: 'confirmations', action: 'index', guest: Base64.encode64(@guest.email)
    else
      flash[:notice] = "No estas invitado!"
      render :index
    end
  end

end