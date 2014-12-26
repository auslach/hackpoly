class AddGenderAgeEthnicityToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :gender, :string
    add_column :user_infos, :age, :integer
    add_column :user_infos, :ethnicity, :string
  end
end
