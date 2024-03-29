class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user= current_user
  end

  def manage_teams
    @teams = current_user.teams
    @new_team = Team.new
  end

  def manage_weddings
    @new_wedding = Wedding.new
  end
end
