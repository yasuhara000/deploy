class AddlikeCountToanswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :likes_count, :integer
  end
end
