class AdddetailToengineers < ActiveRecord::Migration[5.2]
  def change
    add_column :engineers, :first_name, :string
    add_column :engineers, :last_name, :string
    add_column :engineers, :profile, :text
    add_column :engineers, :profile_image_id, :string
    add_column :engineers, :nickname, :string
  end
end
