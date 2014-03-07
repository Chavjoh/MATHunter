class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :chapter, index: true
      t.integer :type
      t.text :content
      t.text :response

      t.timestamps
    end
  end
end
