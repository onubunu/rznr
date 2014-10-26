class CreateHomeboxes < ActiveRecord::Migration
  def change
    create_table :homeboxes do |t|
      t.string :homeboxtitle
      t.string :homeboximage
      t.text :homeboxtest

      t.timestamps
    end
  end
end
