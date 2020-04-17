class AddValuationToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :valuation_id, :integer
  end
end
