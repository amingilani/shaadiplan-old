# frozen_string_literal: true
class WeddingsController < ApplicationController
  before_action :authenticate_user!
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
    @relationship_titles = %w(
      Father
      Mother
      Brother
      Sister
      Friend
      Cousin
      Aunt
      Uncle
      Grandmother
      Grandfather
      It's\ me!
    )
  end

  # GET /weddings/1/edit
  def edit
  end

  # POST /weddings
  # POST /weddings.json
  def create
    team_bride = Team.new(team_bride_params)
    team_groom = Team.new(team_groom_params)
    @wedding = Wedding.create(
      name: "#{team_groom.name.split(' ').first}-\
             #{team_bride.name.split(' ').first}-\
             #{rand(10_000)}"
    )
    @wedding.teams << [team_bride, team_groom]

    if relationship_params[:side] == 'bride'
      Relationship.create team: team_bride, user: current_user, title: relationship_params[:relationship].downcase
    else
      Relationship.create team: team_groom, user: current_user, title: relationship_params[:relationship].downcase
    end

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to @wedding, notice: 'Wedding was successfully created.' }
        format.json { render :show, status: :created, location: @wedding }
      else
        format.html { render :new }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
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
    params.fetch(:wedding).permit(:name)
  end

  def team_bride_params
    params.fetch(:wedding).fetch(:team_bride).permit(:name)
  end

  def team_groom_params
    params.fetch(:wedding).fetch(:team_groom).permit(:name)
  end

  def relationship_params
    params.fetch(:wedding).fetch(:relationship).permit(:side, :relationship)
  end
end
