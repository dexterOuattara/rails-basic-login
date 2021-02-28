class CreateCasecategories < ActiveRecord::Migration[6.1]
  def change
    create_table :casecategories do |t|
      t.string :tag
      t.text :caption

      t.timestamps
    end
  end
end
