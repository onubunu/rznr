class Employee < ActiveRecord::Base
  attr_accessible :employeeabout, :employeeimage, :employeename, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :employeeimage, EmployeeUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  after_update :crop_image  
  def crop_image
    employeeimage.recreate_versions! if crop_x.present?
  end

  validates_presence_of :employeeimage, :employeename, :employeeabout
  validate :employeeimage_size_validation

  private
  
  def employeeimage_size_validation
    errors[:employeeimage] << "should be less than 10MB" if employeeimage.size > 10.megabytes
  end
end