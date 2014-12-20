module UserDecorator

  def display_image
    if self.image.present?
      image_tag("#{self.image}?height=256&width=256", alt: self.name)
    else
      image_tag('user.svg', alt: self.name)
    end
  end

end
