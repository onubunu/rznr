class AddPrenameToContactMessages < ActiveRecord::Migration
  def change
    add_column :contact_messages, :prename, :string
  end
end
