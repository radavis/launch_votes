class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.integer :nominee_id, null: false
      t.integer :nominator_id, null: false
      t.string :content, null: false
      t.timestamps null: false
    end
  end
end
