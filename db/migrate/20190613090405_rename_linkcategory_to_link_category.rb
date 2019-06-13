class RenameLinkcategoryToLinkCategory < ActiveRecord::Migration[5.2]
  def change
    rename_table :linkcategories, :link_categories
  end
end
