class TransactionsController < ApplicationController

  respond_to :html, except: [:sitemap]
  respond_to :xml, only: [:sitemap]

  after_action :verify_authorized, except: %i[index sitemap]
  after_action :verify_policy_scoped, only: %i[index sitemap]

  def index
    @transactions = policy_scope(Transaction)
    # TODO
  end

  def sitemap
    # TODO
  end

end
