class AddAboutinfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :aboutinfo, :text
  end
end
