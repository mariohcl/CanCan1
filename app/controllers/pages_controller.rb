class PagesController < ApplicationController

  skip_authorization_check

  def dashboard
    @users = User.all
  end

  def update_role
    @user = User.find(params[:id])
    if @user.admin?
      @user.visit!
    else
      @user.admin!
    end
    # else
    #   @user.visit!
    # end

    redirect_to pages_dashboard_path
  end


  def destroy

    @user = User.find(params[:id])
    @user.destroy

    redirect_to pages_dashboard_path

  end

end
