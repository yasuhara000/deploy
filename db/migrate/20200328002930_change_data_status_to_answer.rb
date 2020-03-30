class ChangeDataStatusToAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :status, :boolean
  end
end
