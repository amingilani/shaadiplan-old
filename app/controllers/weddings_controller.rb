class WeddingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wedding, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /weddings/1/edit
  def edit
  end

  # POST /weddings
  # POST /weddings.json
  def create
    @wedding = Wedding.create(wedding_params)
    first_team = Team.new(team_first_params)
    @wedding.teams << first_team
    @wedding.teams << Team.new(team_alpha_params)

    first_team.users << current_user

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

  def team_first_params
    params.fetch(:wedding).fetch(:team_first).permit(:name)
  end

  def team_alpha_params
    params.fetch(:wedding).fetch(:team_alpha).permit(:name)
  end
end
