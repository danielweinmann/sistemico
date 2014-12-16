class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_uniqueness_of :permalink, allow_nil: true
  # Permalink cannot be a number, so it can't be confused with the id
  validates_format_of :permalink, :with => /[^\d]+/, allow_nil: true
  before_save :clean_permalink

  before_validation :extract_name_from_email

  def to_param
    (self.permalink && self.permalink.parameterize) || (self.name && "#{self.id}-#{self.name.parameterize}") || self.id
  end

  def set_locale(new_locale)
    if self.locale != new_locale
      self.update locale: new_locale
    end
  end

  private

  def clean_permalink
    self.permalink = self.permalink.gsub(/[^0-9a-z]/i, '').downcase if self.permalink
  end

  def extract_name_from_email
    self.name = self.email.match(/(.+)@/)[1] unless self.name.present?
  end

end
