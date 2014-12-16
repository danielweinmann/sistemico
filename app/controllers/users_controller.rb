class UsersController < ApplicationController

  before_action :set_user

  respond_to :html

  after_action :verify_authorized, except: %i[]
  after_action :verify_policy_scoped, only: %i[]

  def show
    authorize @user
    unless request.path.match(/\A\/#{params[:locale]}\/#{@user.to_param}(\.\w+)?\z/)
      format = request.format.symbol
      return redirect_to user_by_permalink_path("#{@user.to_param}#{".#{format}" unless format == :html}")
    end
    respond_with @user
  end

  private

  def set_user
    @user ||= User.find_by_permalink(params[:id])
    @user ||= User.find(params[:id])
  end

end
