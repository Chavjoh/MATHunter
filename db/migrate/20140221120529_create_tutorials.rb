class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.references :user, index: true
      t.string :title
      t.integer :difficulty
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
