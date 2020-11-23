class AdminUsersController < ApplicationController
  def new
  end
  def home
  end
  def show
    @admin_user = AdminUser.find(params[:id])
  end
end
