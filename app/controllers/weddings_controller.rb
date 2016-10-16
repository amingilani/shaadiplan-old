# frozen_string_literal: true
class WeddingsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_wedding, only: %i(show edit update destroy)

  # GET /weddings
  # GET /weddings.json
  def index
    @weddings = Wedding.all
  end

  # GET /weddings/1
  # GET /weddings/1.json
  def show
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
    @relationship_titles = [
      %w(Father father),
      %w(Mother mother),
      %w(Brother brother),
      %w(Sister sister),
      %w(Friend friend),
      %w(Cousin cousin),
      %w(Aunt aunt),
      %w(Uncle uncle),
      %w(Grandmother grandmother),
      %w(Grandfather grandfather),
      %w(It's\ me! self)
    ]
  end

  # GET /weddings/1/edit
  def edit
  end

  # POST /weddings
  # POST /weddings.json
  def create
    @wedding = Wedding.create wedding_params
    @wedding.organizers << Organizer.new(organizer_params)

    if @wedding.save
      redirect_to @wedding, notice: 'Wedding was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to @wedding, notice: 'Wedding was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding }
      else
        format.html { render :edit }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    @wedding.destroy
    respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Wedding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wedding
    @wedding = Wedding.find(params[:id])
  end

  ## params
  def wedding_params
    params.fetch(:wedding).permit(:bride_name, :groom_name)
  end

  def organizer_params
    organizer = params.fetch(:wedding).fetch(:organizer).permit(:side, :relationship)
    organizer[:user] = current_user
    organizer
  end
end
