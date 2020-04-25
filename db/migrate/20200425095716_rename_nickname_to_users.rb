class RenameNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :nickname, :name
  end
end
