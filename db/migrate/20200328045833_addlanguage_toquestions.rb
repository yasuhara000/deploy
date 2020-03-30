class AddlanguageToquestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :language, :string
  end
end
