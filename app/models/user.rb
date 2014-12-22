class User < ActiveRecord::Base

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :transactions_from, class_name: "Transaction", foreign_key: "from_user_id"
  has_many :transactions_to, class_name: "Transaction", foreign_key: "to_user_id"
  
  validates_uniqueness_of :permalink, allow_nil: true
  # Permalink cannot be a number, so it can't be confused with the id
  validates_format_of :permalink, :with => /[^\d]+/, allow_nil: true
  before_save :clean_permalink

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.with_transactions
    where("id IN (SELECT DISTINCT from_user_id FROM transactions) OR id IN (SELECT DISTINCT to_user_id FROM transactions)")
  end

  def to_param
    (self.permalink && self.permalink.parameterize) || (self.name && "#{self.id}-#{self.name.parameterize}") || self.id
  end

  def set_locale(new_locale)
    if self.locale != new_locale
      self.update locale: new_locale
    end
  end

  def balance
    sum_from = self.transactions_from.with_state(:approved).sum(:value)
    sum_to = self.transactions_to.with_state(:approved).sum(:value)
    sum_to - sum_from
  end

  private

  def clean_permalink
    self.permalink = self.permalink.gsub(/[^0-9a-z]/i, '').downcase if self.permalink
  end

end
