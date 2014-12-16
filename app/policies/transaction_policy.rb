class TransactionPolicy < ApplicationPolicy

  def approve?
    is_to_or_admin?
  end

  def reject?
    is_to_or_admin?
  end

  def permitted_attributes
    if create?
      [:value, :description]
    else
      []
    end
  end

  protected

  def is_owned_by?(user)
    user.present? && record.from_user == user
  end

  def is_to_or_admin?
    is_to?(user) || is_admin?
  end

  def is_to?(user)
    user.present? && record.to_user == user
  end

end
