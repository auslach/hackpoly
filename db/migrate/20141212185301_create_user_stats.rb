class CreateUserStats < ActiveRecord::Migration
  def change
    create_table :user_stats do |t|
      t.text :gender
      t.integer :age
      t.text :ethnicity

      t.timestamps
    end
  end
end
