class AddSourceToHomeboxes < ActiveRecord::Migration
  def change
    add_column :homeboxes, :source, :string
  end
end
