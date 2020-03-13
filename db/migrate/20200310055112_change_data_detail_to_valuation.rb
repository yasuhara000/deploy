class ChangeDataDetailToValuation < ActiveRecord::Migration[5.2]
  def change
    change_column :valuations, :user_id, :integer
    change_column :valuations, :engineer_id, :integer
    change_column :valuations, :status, :integer
  end
end
