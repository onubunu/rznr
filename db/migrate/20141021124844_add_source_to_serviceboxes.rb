class AddSourceToServiceboxes < ActiveRecord::Migration
  def change
    add_column :serviceboxes, :source, :string
  end
end
