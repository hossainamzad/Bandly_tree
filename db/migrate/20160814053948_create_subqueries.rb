class CreateSubqueries < ActiveRecord::Migration
  def change
    create_table :subqueries do |t|
      t.string :artist

      t.timestamps null: false
    end
  end
end
