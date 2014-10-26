class AddJobinfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :jobinfo, :text
  end
end
