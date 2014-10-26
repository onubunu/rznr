class CreateHomesliders < ActiveRecord::Migration
  def change
    create_table :homesliders do |t|
      t.string :sliderimage
      t.string :sliderlink
      t.string :slidertext

      t.timestamps
    end
  end
end
