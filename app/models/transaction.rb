class Transaction < ActiveRecord::Base

  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  validates_presence_of :from_user, :to_user, :value
  validates :value, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :description, length: { maximum: 140 }

  state_machine initial: :pending do

    state :pending
    state :approved
    state :rejected

    event :approve do
      transition :pending => :approved
    end

    event :reject do
      transition :pending => :rejected
    end

  end

  def self.involving(user)
    where("from_user_id = #{user.id} OR to_user_id = #{user.id}")
  end

end
