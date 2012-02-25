class AddIndexToUsersEmailAndPhone < ActiveRecord::Migration
  def change
    # Ensure that email and phone are unique. Validations in User model are not enough.
    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end
