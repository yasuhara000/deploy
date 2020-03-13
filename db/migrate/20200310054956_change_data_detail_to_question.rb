class ChangeDataDetailToQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :user_id, :integer
    change_column :questions, :status, :integer
  end
end
