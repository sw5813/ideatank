class AddSummaryToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :summary, :string
  end
end
