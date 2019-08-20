class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
