module UserDecorator

  def display_image
    if self.image.present?
      image_tag("#{self.image}?height=256&width=256", alt: self.name)
    else
      image_tag('user.svg', alt: self.name)
    end
  end

  def balance_label
    label = t('activerecord.attributes.user.balance').downcase 
    if self.balance == 0
      label.pluralize(2) # force Sistêmicos (in the plural) when 0
    else
      label.pluralize(self.balance)
    end
  end

  def status_label(transactions)
    if self.balance == 0 && transactions
      t('users.show.status_balanced', user: self.name)
    elsif self.balance == 0 && !transactions
      t('users.show.status_inactive', user: self.name)
    elsif self.balance < 0
      t('users.show.status_unbalenced_negative', user: self.name)
    else
      t('users.show.status_unbalenced_positive', user: self.name)
    end
  end

end
