class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :from_user_id, null: false, foreign_key: { references: :users }
      t.integer :to_user_id, null: false, foreign_key: { references: :users }
      t.integer :value, null: false
      t.string :state
    end
  end
end
