class AddTerminfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :terminfo, :text
  end
end
