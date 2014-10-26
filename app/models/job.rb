class Job < ActiveRecord::Base
  attr_accessible :jobdescription, :jobtitle, :validdate
end
