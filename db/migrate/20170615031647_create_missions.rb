class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.belongs_to :section
      t.string :name
      t.text :description
      t.integer :checkpoints_count, default: 0

      t.timestamps
    end
  end
end
