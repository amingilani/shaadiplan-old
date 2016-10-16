class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_weddings = current_user.organizers
  end

  def manage_teams
    @teams = current_user.teams
    @new_team = Team.new
  end

  def manage_weddings
    @new_wedding = Wedding.new
  end
end
