module UserDecorator

  def display_image
    if self.image.present?
      image_tag("#{self.image}?type=large")
    else
      image_tag('user.svg')
    end
  end

end
