class CreateCheckpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :checkpoints do |t|
      t.belongs_to :section
      t.string :name
      t.boolean :checked, default: false
      t.boolean :is_text, default: false
      t.string :text

      t.timestamps
    end
  end
end
