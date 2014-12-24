class AddDefaultValuesToUserAdminAndAdmitted < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, default: false
    change_column :users, :admitted, :boolean, default: false
  end
end
