class TransactionsController < StateController

  before_action :set_transaction, only: [:approve, :reject]

  respond_to :html, except: [:sitemap]
  respond_to :xml, only: [:sitemap]

  after_action :verify_authorized, except: %i[home index sitemap]
  after_action :verify_policy_scoped, only: %i[home index sitemap]

  def home
    @transactions = policy_scope(Transaction).with_state(:approved).order("updated_at DESC").limit(3)
    @users = policy_scope(User).order("updated_at DESC").limit(12)
    # This will instantiate UserDecorator for the users
    @from_users = @transactions.map &:from_user
    @to_users = @transactions.map &:to_user
    respond_with @transactions
  end

  def index
    @transactions = policy_scope(Transaction).with_state(:approved).order("updated_at DESC")
    # This will instantiate UserDecorator for the users
    @from_users = @transactions.map &:from_user
    @to_users = @transactions.map &:to_user
    respond_with @transactions
  end

  def sitemap
    @users = policy_scope(User).with_transactions.order("updated_at DESC")
    respond_with @users
  end

  def approve
    transition_state(@transaction, :approve, user_by_permalink_path(@transaction.to_user))
  end

  def reject
    transition_state(@transaction, :reject, user_by_permalink_path(@transaction.to_user))
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

end
