class Project < ApplicationRecord
  has_many_attached :images
  validates :name, presence: true
  validates :description, presence: true
  validate :image_type

  def thumbnail input
    # binding.pry
    return self.images[input].variant(resize: '300x300!').processed
    # return Rails.application.routes.url_helpers.rails_representation_url(self.images[input].variant(resize: "300x300!").processed, only_path: true)
    # variant = self.images[input]
    #         .variant(resize: '300x300')
    #         .processed 
# variant.service.send(:path_for, variant.key)
  end  

  private
  def image_type
    if images.attached? == false 
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png image/JPG image/jpg'))
        errors.add(:images, 'needs to be a JPEG or PNG')
      end
    end
  end
end

