class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.integer :missions_count, default: 0

      t.timestamps
    end
  end
end
