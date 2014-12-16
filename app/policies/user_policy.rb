class UserPolicy < ApplicationPolicy

  def is_owned_by?(user)
    user.present? && record.id == user.id
  end

end
