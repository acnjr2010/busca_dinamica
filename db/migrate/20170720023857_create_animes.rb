class CreateAnimes < ActiveRecord::Migration[5.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.integer :year
      t.integer :episodes
      t.boolean :manga
      t.string :author

      t.timestamps
    end
  end
end
