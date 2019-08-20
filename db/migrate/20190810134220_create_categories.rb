class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.bigint :buffer, null: false, default: 5
      t.bigint :min_quan, null: false, default: 2

      t.timestamps
    end
  end
end
