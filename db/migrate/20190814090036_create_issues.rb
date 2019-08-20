class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :details
      t.references :item
      t.references :user
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
