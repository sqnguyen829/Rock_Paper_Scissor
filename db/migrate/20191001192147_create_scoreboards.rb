class CreateScoreboards < ActiveRecord::Migration[5.2]
  def change
    create_table :scoreboards do |t|
      t.integer :user_id
      t.integer :status_id
      t.integer :streak
    end
  end
end
