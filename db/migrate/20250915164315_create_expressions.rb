class CreateExpressions < ActiveRecord::Migration[8.0]
  def change
    create_table :expressions do |t|
      t.string :en_us
      t.string :es_mx
      t.integer :page
      t.references :root_word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
