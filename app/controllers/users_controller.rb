class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  respond_to :html

  after_action :verify_authorized, except: %i[]
  after_action :verify_policy_scoped, only: %i[]

  def show
    authorize @user
    unless request.path.match(/\A\/#{params[:locale]}\/#{@user.to_param}(\.\w+)?\z/)
      format = request.format.symbol
      return redirect_to user_by_permalink_path("#{@user.to_param}#{".#{format}" unless format == :html}")
    end
    @transactions = Transaction.involving(@user).with_state(:approved).order("updated_at DESC")
    if policy(@user).update?
      # This will instantiate UserDecorator for the users
      @pending = Transaction.involving(@user).with_state(:pending).order("updated_at DESC")
      @pending_from = @pending.map &:from_user
      @pending_to = @pending.map &:to_user
    else
      @pending = nil
    end
    # This will instantiate UserDecorator for the users
    @from_users = @transactions.map &:from_user
    @to_users = @transactions.map &:to_user
    respond_with @user
  end

  private

  def set_user
    @user ||= User.find_by_permalink(params[:id])
    @user ||= User.find(params[:id])
  end

end
