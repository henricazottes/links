class ChangeFormatInLinkAndUser < ActiveRecord::Migration[5.2]
  def change
    change_column :links, :title, :text
    change_column :links, :url, :text
    change_column :users, :username, :text
  end
end
