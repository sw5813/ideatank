class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :problem
      t.text :description
      t.integer :forum_id

      t.timestamps
    end
  end
end
