class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employeename
      t.string :employeeimage
      t.text :employeeabout

      t.timestamps
    end
  end
end
