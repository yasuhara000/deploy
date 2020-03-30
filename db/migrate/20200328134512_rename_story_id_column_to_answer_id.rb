class RenameStoryIdColumnToAnswerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :story_id, :answer_id
  end
end
