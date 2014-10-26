class AddKontaktinfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :kontaktinfo, :text
  end
end
