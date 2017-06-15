class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.belongs_to :checkpoint
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
