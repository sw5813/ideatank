class AddApprovedToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :approved, :boolean, default: false
  end
end
