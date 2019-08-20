class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :brand
      t.references :category, null: false
      t.references :employee
      t.boolean :status, null: false, default: true
      t.text :notes
      

      t.timestamps
    end
  end
end
