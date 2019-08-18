class RenameFromUserIconeToUserIconOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column:users, :user_icone, :user_icon
  end
end
