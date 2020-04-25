class RenameNicknameToEngineers < ActiveRecord::Migration[5.2]
  def change
    rename_column :engineers, :nickname, :name
  end
end
