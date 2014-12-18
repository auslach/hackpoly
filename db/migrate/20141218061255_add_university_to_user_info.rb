class AddUniversityToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :university, :string
  end
end
