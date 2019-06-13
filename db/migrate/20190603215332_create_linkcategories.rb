class CreateLinkcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :link_categories do |t|
      t.belongs_to :link, index: true
      t.belongs_to :category, index: true
    end
  end
end
