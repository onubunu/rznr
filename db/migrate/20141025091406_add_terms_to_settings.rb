class AddTermsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :terms, :text
    add_column :settings, :legalnotice, :text
  end
end
