class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobtitle
      t.text :jobdescription
      t.datetime :validdate

      t.timestamps
    end
  end
end
