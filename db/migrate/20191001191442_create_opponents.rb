class CreateOpponents < ActiveRecord::Migration[5.2]
  def change
    create_table :opponents do |t|
      t.string :status
      t.string :name
      t.string :choice
    end
  end
end
