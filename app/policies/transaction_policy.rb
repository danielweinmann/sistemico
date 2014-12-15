class TransactionPolicy < ApplicationPolicy

  def permitted_attributes
    if create?
      [:value]
    else
      []
    end
  end

end
