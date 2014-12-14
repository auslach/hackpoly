class AddUrlToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :url, :text
  end
end
