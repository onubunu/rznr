class CreateReferenceboxes < ActiveRecord::Migration
  def change
    create_table :referenceboxes do |t|
      t.string :referencetitle
      t.string :referenceimage
      t.text :referencetext

      t.timestamps
    end
  end
end
