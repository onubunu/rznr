class AddLegalnoticeinfoToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :legalnoticeinfo, :text
  end
end
