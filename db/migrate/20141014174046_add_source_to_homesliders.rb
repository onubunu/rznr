class AddSourceToHomesliders < ActiveRecord::Migration
  def change
    add_column :homesliders, :source, :string
  end
end
