class ChangeDataDetailToAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :engineer_id, :integer
    change_column :answers, :status, :integer
  end
end
