class Users::TransactionsController < ApplicationController

  before_action :set_user

  respond_to :html

  after_action :verify_authorized, except: %i[]
  after_action :verify_policy_scoped, only: %i[]
  before_action :authenticate_user!

  def new    
    @transaction = @user.transactions_to.new
    @transaction.from_user = current_user
    authorize @transaction
    respond_with @transaction
  end
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
