class Change3ServiceinfoForSettings < ActiveRecord::Migration
def up
    change_column :settings, :serviceinfo, :text, :limit => nil
end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :settings, :serviceinfo, :text
end
end