class AddNewPasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_password
    add_column :users, :password, :string
  end
end
