class AddServiceinfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :serviceinfo, :string
  end
end
