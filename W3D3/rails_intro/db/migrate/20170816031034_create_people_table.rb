class CreatePeopleTable < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :house_id
    end
  end
end
