class ConfirmationsController < ApplicationController

  before_action :validate_guest

  def validate_guest
    guest_email = Base64.decode64(params[:guest]) if params[:guest]
    unless guest_email
      flash[:error] = 'Necesito tu email primero!'
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
    @invitation.guests.destroy_all
    guests = []
    if params[:commit].downcase.to_sym == :no
      @invitation.attendance = 2
    elsif params[:commit].downcase.to_sym == :si
      @invitation.attendance = 1
      if @invitation.adults.to_i > 0
        params[:guest_adult][:first_name].each_with_index do |first_name, i|
          last_name = params[:guest_adult][:last_name][i]
          if last_name.present?
            guest = Guest.create!(
              first_name: first_name,
              last_name: last_name,
              kid: false,
              main_guest: @guest
            )
            guests << guest
          end
        end
      end
      if @invitation.kids.to_i > 0
        params[:guest_kid][:first_name].each_with_index do |first_name, i|
          last_name = params[:guest_kid][:last_name][i]
          if last_name.present?
            guest = Guest.create!(
                first_name: first_name,
                last_name: last_name,
                kid: true,
                main_guest: @guest
            )
            guests << guest
          end
        end
      end
    end
    @invitation.guests = guests
    @invitation.save!
    redirect_to controller: 'confirmations', action: 'index', guest: Base64.encode64(@guest.email)
  end

end