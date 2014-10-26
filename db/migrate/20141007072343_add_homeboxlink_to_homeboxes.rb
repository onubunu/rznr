class AddHomeboxlinkToHomeboxes < ActiveRecord::Migration
  def change
    add_column :homeboxes, :homeboxlink, :string
  end
end
