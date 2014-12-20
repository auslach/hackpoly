class AddAdmittedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admitted, :boolean
  end
end
