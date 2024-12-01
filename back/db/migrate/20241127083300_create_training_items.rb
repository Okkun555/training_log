class CreateTrainingItems < ActiveRecord::Migration[7.1]
  def change
    create_table :training_items do |t|
      t.references :user, null: false
      t.string :name, null: false, limit: 100, comment: '種目名'
      t.integer :weight_unit, default: 1, null: false, limit:1, comment: '重量の単位（1:kg, 2:lib）'
      t.timestamps
    end

    add_foreign_key :training_items, :users
  end
end