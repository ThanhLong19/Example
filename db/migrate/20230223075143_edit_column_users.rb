class EditColumnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer, :default => 0
    remove_column :users, :provider
  end
end
