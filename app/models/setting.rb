class Setting < ActiveRecord::Base
  attr_accessible :legalnotice, :terms, :legalnoticeinfo, :terminfo, :jobinfo, :contactinfo, :aboutinfo, :referenceinfo, :serviceinfo, :firmcity, :firmcountry, :firmfax, :firmlogo, :firmmail, :firmname, :firmnameadd, :firmowner, :firmphone, :firmstreet, :firmtaxno1, :firmtaxno2, :firmweb, :firmzipcode, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :firmlogo, LogoUploader
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  after_update :crop_image  
  def crop_image
    firmlogo.recreate_versions! if crop_x.present?
  end

  validates :firmlogo, presence: true
  validates :firmname, presence: true
  validates :firmowner, presence: true
  validates :firmstreet, presence: true
  validates :firmzipcode, presence: true
  validates :firmcity, presence: true
  validates :firmcountry, presence: true
  validates :firmphone, presence: true
  validates :firmmail, format: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates :firmweb, presence: true
  validates :terms, presence: true
  
  validate :firmlogo_size_validation

  private

  def firmlogo_size_validation
    errors[:firmlogo] << "should be less than 10MB" if firmlogo.size > 10.megabytes
  end
end
