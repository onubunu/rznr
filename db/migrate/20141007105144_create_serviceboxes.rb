class CreateServiceboxes < ActiveRecord::Migration
  def change
    create_table :serviceboxes do |t|
      t.string :serviceboxtitle
      t.string :serviceboximage
      t.text :serviceboxtext

      t.timestamps
    end
  end
end
