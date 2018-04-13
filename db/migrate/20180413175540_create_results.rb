class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.datetime :date_time
      t.string :classes
      t.string :teacher
      t.integer :grade
      t.string :email
      t.integer :behaviour
      t.string :comment

      t.timestamps null: false
    end
  end
end
