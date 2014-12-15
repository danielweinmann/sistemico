class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  before_validation :extract_name_from_email

  def set_locale(new_locale)
    if self.locale != new_locale
      self.update locale: new_locale
    end
  end

  private
  def extract_name_from_email
    self.name = self.email.match(/(.+)@/)[1] unless self.name.present?
  end

end
