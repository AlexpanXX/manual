class CreateUserCheckpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :user_checkpoints do |t|
      t.belongs_to :user
      t.belongs_to :checkpoint
      
      t.timestamps
    end
  end
end
