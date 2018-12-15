class ConfirmationsController < ApplicationController

  before_action :validate_guest

  def validate_guest
    guest_email = Base64.decode64(params[:guest]) if params[:guest]
    unless guest_email
      flash[:alert] = 'Necesito tu email primero!'
      redirect_to :root
      return
    end
    @guest = MainGuest.find_by_email(guest_email)
    redirect_to :root and return unless @guest
  end

  def index
  end

  def edit
    @invitation = Invitation.find(params[:id])
    redirect_to :root and return unless @guest.email ==  @invitation.main_guest.email
  end

  def update
    @invitation = Invitation.find(params[:id])
    if params[:commit].downcase.to_sym == :no
      @invitation.attendance = 2
    elsif params[:commit].downcase.to_sym == :si
      @invitation.attendance = 1
    end
    @invitation.save!
    redirect_to controller: 'confirmations', action: 'index', guest: Base64.encode64(@guest.email)
  end

end