class ConfirmationsController < ApplicationController

  before_action :validate_guest

  def validate_guest
    unless session[:guest_email]
      flash[:alert] = 'Necesito tu email primero!'
      redirect_to :root
      return
    end
    @guest = MainGuest.find_by_email(session[:guest_email])
    redirect_to :root and return unless @guest
  end

  def index
  end

  def edit
    @invitation = Invitation.find(params[:id])
    redirect_to :root and return unless @guest.email ==  @invitation.main_guest.email
  end

end