class CreateInterviewcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :interviewcategories do |t|
      t.string :tag
      t.text :caption

      t.timestamps
    end
  end
end
