class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id, null: false
      t.text :first_name
      t.text :last_name
      t.text :major
      t.text :year_in_school
      t.text :previous_hackathons
      t.text :coolest_built
      t.text :skillset

      t.text :website_url
      t.text :github_url
      t.text :linkedin_url

      t.timestamps
    end
  end
end
