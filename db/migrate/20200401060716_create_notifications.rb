class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      
      t.timestamps
    end
    add_column :notifications, :question_id, :integer
    add_column :notifications, :e_visited_id, :integer
    add_column :notifications, :e_visiter_id, :integer
    add_column :notifications, :visited_id, :integer
    add_column :notifications, :visiter_id, :integer
    add_column :notifications, :answer_id, :integer
    add_column :notifications, :checked, :boolean,default: false, null: false
    add_column :notifications, :action, :string
  end
end
