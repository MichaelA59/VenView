class RenameAvatarUrlToProfilePicUrl < ActiveRecord::Migration[5.0]
  def up
    rename_column :users, :avatar_url, :profile_pic_url
  end

  def down
    rename_column :users, :profile_pic_url, :avatar_url
  end
end
