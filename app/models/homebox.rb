class Homebox < ActiveRecord::Base
  attr_accessible :source, :homeboximage, :homeboxtext, :homeboxtitle, :homeboxlink, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :homeboximage, HomeboxUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  after_update :crop_image  
  def crop_image
    homeboximage.recreate_versions! if crop_x.present?
  end

  validates_presence_of :homeboximage, :homeboxtitle, :homeboxlink, :homeboxtext
  validate :homeboximage_size_validation

  private
  
  def homeboximage_size_validation
    errors[:homeboximage] << "should be less than 10MB" if homeboximage.size > 10.megabytes
  end
end
