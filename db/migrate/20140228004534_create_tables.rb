class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :id_from_restaurant

      t.timestamps
    end
  end
end
