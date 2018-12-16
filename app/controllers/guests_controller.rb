class GuestsController < ApplicationController
  def index
  end

  def create
    @guest = MainGuest.find_by_email(params[:guest_email])
    if @guest && !@guest.invitations.empty?
      redirect_to controller: 'confirmations', action: 'index', guest: Base64.encode64(@guest.email)
    else
      flash[:error] = "Ese email no esta en la lista! Quizas te invitaron con otro email?"
      redirect_to :root
    end
  end

end