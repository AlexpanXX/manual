class CreateCheckpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :checkpoints do |t|
      t.belongs_to :mission
      t.string :name
      t.boolean :checked, default: false
      t.boolean :is_text, default: false

      t.timestamps
    end
  end
end
