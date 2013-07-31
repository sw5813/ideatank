class AddTopicIdToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :topic_id, :integer
  end
end
