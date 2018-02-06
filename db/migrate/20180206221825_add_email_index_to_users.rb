class AddEmailIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    # Make email be unique
    add_index :users, :email, unique: true
  end
end
