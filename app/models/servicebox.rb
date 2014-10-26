class Servicebox < ActiveRecord::Base
  attr_accessible :serviceboximage, :serviceboxtext, :serviceboxtitle, :source, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :serviceboximage, ServiceboxUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  after_update :crop_image  
  def crop_image
    serviceboximage.recreate_versions! if crop_x.present?
  end
  
  validates_presence_of :serviceboximage, :serviceboxtitle
  validate :serviceboximage_size_validation

  private
  
  def serviceboximage_size_validation
    errors[:serviceboximage] << "should be less than 10MB" if serviceboximage.size > 10.megabytes
  end
end