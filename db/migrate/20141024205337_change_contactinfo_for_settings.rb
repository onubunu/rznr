class ChangeContactinfoForSettings < ActiveRecord::Migration
def self.up
    rename_column :settings, :kontaktinfo, :contactinfo
end
def self.down

end
end