# frozen_string_literal: true
class OrganizersController < ApplicationController
  before_action :set_relationship_titles
  before_action :authenticate_user!
  before_action :set_wedding
  before_action :set_organizer, only: %i(show edit update destroy)

  # GET /organizers
  # GET /organizers.json
  def index
    @organizers = Organizer.where(wedding: @wedding)
  end

  # GET /organizers/1
  # GET /organizers/1.json
  def show
  end

  # GET /organizers/new
  def new
    @organizer = Organizer.new
  end

  # GET /organizers/1/edit
  def edit
  end

  # POST /organizers
  # POST /organizers.json
  def create
    @organizer = Organizer.new(organizer_params)

    respond_to do |format|
      if @organizer.save
        format.html { redirect_to @organizer, notice: 'Organizer was successfully created.' }
        format.json { render :show, status: :created, location: @organizer }
      else
        format.html { render :new }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizers/1
  # PATCH/PUT /organizers/1.json
  def update
    if @organizer.update(organizer_params)
      redirect_to wedding_organizer_path @wedding, @organizer, notice: 'Organizer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /organizers/1
  # DELETE /organizers/1.json
  def destroy
    @organizer.destroy
    respond_to do |format|
      format.html { redirect_to organizers_url, notice: 'Organizer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organizer
    @organizer = @wedding.organizers.find(params[:id])
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organizer_params
    params.require(:organizer).permit(:relationship, :side, :wedding_id, :user_id)
  end

  def set_relationship_titles
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
end
