class ContactMessage < ActiveRecord::Base
  attr_accessible :email, :message, :name, :title, :subject, :prename
	validates :title, presence: true
	validates :prename, length: {:minimum => 2}
	validates :name, length: {:minimum => 2}
	validates :email, format: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
	validates :subject, presence: true
	validates :message, length: {:minimum => 5}
end
