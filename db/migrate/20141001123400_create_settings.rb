class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :firmlogo
      t.string :firmname
      t.string :firmnameadd
      t.string :firmowner
      t.string :firmstreet
      t.string :firmzipcode
      t.string :firmcity
      t.string :firmcountry
      t.string :firmphone
      t.string :firmfax
      t.string :firmmail
      t.string :firmweb
      t.string :firmtaxno1
      t.string :firmtaxno2

      t.timestamps
    end
  end
end
