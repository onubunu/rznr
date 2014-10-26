class Referencebox < ActiveRecord::Base
  attr_accessible :referenceimage, :referencetext, :referencetitle, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :referenceimage, ReferenceboxUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  after_update :crop_image  
  def crop_image
    referenceimage.recreate_versions! if crop_x.present?
  end

  validates_presence_of :referenceimage, :referencetitle
  validate :referenceimage_size_validation

  private
  
  def referenceimage_size_validation
    errors[:referenceimage] << "should be less than 10MB" if referenceimage.size > 10.megabytes
  end
end