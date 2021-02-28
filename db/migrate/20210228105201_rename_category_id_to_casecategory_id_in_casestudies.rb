class RenameCategoryIdToCasecategoryIdInCasestudies < ActiveRecord::Migration[6.1]
  def up
    rename_column :casestudies, :category_id, :casecategory_id
  end

  def down
    rename_column :casestudies, :casecategory_id, :category_id
  end
end
