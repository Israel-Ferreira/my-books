class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :author_name, null: false
      t.string :country

      t.timestamps
    end
  end
end
