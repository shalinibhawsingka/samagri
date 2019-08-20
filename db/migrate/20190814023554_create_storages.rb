class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.bigint :quantity
      t.references :category
      t.references :item

      t.timestamps
    end
  end
end
