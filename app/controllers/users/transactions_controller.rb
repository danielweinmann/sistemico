class Users::TransactionsController < ApplicationController

  before_action :set_user

  respond_to :html

  after_action :verify_authorized, except: %i[]
  after_action :verify_policy_scoped, only: %i[]
  before_action :authenticate_user!, only: %i[new]

  def new    
    @transaction = @user.transactions_to.new
    @transaction.from_user = current_user
    @transaction.value = params[:value].to_i
    authorize @transaction
    respond_with @transaction
  end

  def create
    @transaction = @user.transactions_to.new(transaction_params)
    @transaction.from_user = current_user
    authorize @transaction
    @transaction.save
    respond_with @transaction, location: -> { user_by_permalink_path(@user) }
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def transaction_params
    params.require(:transaction).permit(*policy(@transaction || Transaction.new).permitted_attributes)
  end

end
