class AddPersonDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :null => false, :default => ""
    add_column :users, :last_name, :string, :null => false, :default => ""
    add_column :users, :hobby, :string
  end
end
