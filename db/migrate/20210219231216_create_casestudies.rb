class CreateCasestudies < ActiveRecord::Migration[6.1]
  def change
    create_table :casestudies do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
