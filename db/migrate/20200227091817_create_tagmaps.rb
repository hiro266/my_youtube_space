class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.references :post, foreign_key: true, null: false
      t.references :tag, foreign_key: true,  null: false

      t.timestamps
    end
  end
end
