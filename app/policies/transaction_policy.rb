class TransactionPolicy < ApplicationPolicy

  def permitted_attributes
    if create?
      [:value, :description]
    else
      []
    end
  end

  def is_owned_by?(user)
    user.present? && record.from_user == user
  end

end