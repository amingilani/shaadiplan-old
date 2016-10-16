# frozen_string_literal: true
class GuestsController < ApplicationController
  before_action :set_wedding
  before_action :set_guest, only: %i(show edit update destroy)

  # GET weddings/1/guests
  def index
    @guests = @wedding.guests
  end

  # GET weddings/1/guests/1
  def show
  end

  # GET weddings/1/guests/new
  def new
    @guest = @wedding.guests.build
    set_invitee
    return unless @invitee
    @invitee_title = Relationship.find_by(
      team: @wedding.teams.map(&:id),
      user: @invitee
    ).title
    @invitee_team = @invitee.teams.find_by(wedding: @wedding)
  end

  # GET weddings/1/guests/1/edit
  def edit
  end

  # POST weddings/1/guests
  def create
    @guest = @wedding.guests.build(guest_params)

    if @guest.save
      redirect_to([@guest.wedding, @guest], notice: 'Guest was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT weddings/1/guests/1
  def update
    if @guest.update_attributes(guest_params)
      redirect_to([@guest.weddings, @guest], notice: 'Guest was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE weddings/1/guests/1
  def destroy
    @guest.destroy

    redirect_to weddings_guests_url(@wedding)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_guest
    @guest = @wedding.guests.find(params[:id])
  end

  def wedding_params
    params.permit(:wedding_id)
  end

  # Only allow a trusted parameter "white list" through.
  def guest_params
    params.require(:guest).permit(:name, :email, :address, :phone, :team_id, :invited_by)
  end

  def set_invitee
    invitee_params = params.permit(:invitee)
    @invitee = User.find(invitee_params[:invitee]) if invitee_params.present?
  end
end
