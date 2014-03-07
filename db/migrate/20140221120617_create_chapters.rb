class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :tutorial, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
