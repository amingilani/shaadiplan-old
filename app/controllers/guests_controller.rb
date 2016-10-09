class GuestsController < ApplicationController
  before_action :set_guests
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

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
  end

  # GET weddings/1/guests/1/edit
  def edit
  end

  # POST weddings/1/guests
  def create
    @guest = @wedding.guests.build(guest_params)

    if @guest.save
      redirect_to([@guest.weddings, @guest], notice: 'Guest was successfully created.')
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
    def set_guests
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
      params.require(:guest).permit(:name, :email, :address, :phone)
    end
end
