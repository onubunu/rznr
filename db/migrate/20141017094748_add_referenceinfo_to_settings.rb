class AddReferenceinfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :referenceinfo, :text
  end
end
