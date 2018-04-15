class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.integer :day_of_birth
      t.integer :month_of_birth
      t.integer :year_of_birth
      t.string :school
      t.string :email
      t.string :comment

      t.timestamps null: false
    end
  end
end
