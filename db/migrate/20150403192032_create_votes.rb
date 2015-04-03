class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :nomination_id, null: false
      t.timestamps null: false
    end

    add_index :votes, [:user_id, :nomination_id], unique: true
  end
end
