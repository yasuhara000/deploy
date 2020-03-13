class CreateValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :valuations do |t|
      t.integer :user_id
      t.integer :engineer_id
      t.string :title
      t.text :comment
      t.integer :status

      t.timestamps
    end
  end
end
