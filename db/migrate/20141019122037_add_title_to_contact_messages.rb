class AddTitleToContactMessages < ActiveRecord::Migration
  def change
    add_column :contact_messages, :title, :string
    add_column :contact_messages, :subject, :string
  end
end
