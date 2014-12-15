class TransactionsController < ApplicationController

  respond_to :html, except: [:sitemap]
  respond_to :xml, only: [:sitemap]

  def index
    @transactions = policy_scope(Transaction)
    # TODO
  end

  def sitemap
    # TODO
  end

end
