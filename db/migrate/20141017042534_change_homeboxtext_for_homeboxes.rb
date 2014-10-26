class ChangeHomeboxtextForHomeboxes < ActiveRecord::Migration
def self.up
    rename_column :homeboxes, :homeboxtest, :homeboxtext
end
def self.down

end
end