class CreateExamples < ActiveRecord::Migration[8.0]
  def change
    create_table :examples do |t|
      t.integer :page
      t.string :en_us
      t.string :es_mx
      t.references :root_word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
