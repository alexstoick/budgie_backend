class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.string :category

      t.timestamps
    end
  end
end
