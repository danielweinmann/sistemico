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
    @transactions = Transaction.involving(@user)
    if policy(@user).update?
      @pending = @user.transactions_to.with_state(:pending)
    else
      @pending = []
    end
    # This will instantiate UserDecorator for the users
    @from_users = @transactions.map &:from_user
    @to_users = @transactions.map &:to_user
    @pending_from = @pending.map &:from_user
    @pending_to = @pending.map &:to_user
    respond_with @user
  end

  private

  def set_user
    @user ||= User.find_by_permalink(params[:id])
    @user ||= User.find(params[:id])
  end

end
