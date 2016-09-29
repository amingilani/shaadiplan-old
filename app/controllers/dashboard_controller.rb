class DashboardController < ApplicationController
  before_action :logged_in_using_omniauth?

  def show
    @user
  end
end
