class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.string :title
      t.string :country

      t.timestamps
    end
  end
end
