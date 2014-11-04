class Homeslider < ActiveRecord::Base
  attr_accessible :sliderimage, :sliderlink, :slidertext, :source, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :sliderimage, HomesliderUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  after_update :crop_image  
  def crop_image
    sliderimage.recreate_versions! if crop_x.present?
  end
  
  validates_presence_of :sliderimage, :homeboxlink
  validate :sliderimage_size_validation

  private
  
  def sliderimage_size_validation
    errors[:sliderimage] << "should be less than 10MB" if sliderimage.size > 10.megabytes
  end

  LINKS = [["Startseite", "../"], ["Leistungen", "serviceboxes"], ["Referenzen", "referenceboxes"], ["Über uns", "employees"], ["Kontakt", "contact_messages/new"], ["Stellenangebote", "jobs"]];
end
