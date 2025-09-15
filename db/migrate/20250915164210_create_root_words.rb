class CreateRootWords < ActiveRecord::Migration[8.0]
  def change
    create_table :root_words do |t|
      t.string :display_name
      t.integer :page
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
