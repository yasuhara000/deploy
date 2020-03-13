class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :engineer_id
      t.string :title
      t.text :answer
      t.integer :status

      t.timestamps
    end
  end
end
