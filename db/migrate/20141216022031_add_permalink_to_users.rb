class AddPermalinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permalink, :string, index: { unique: true }
  end
end
