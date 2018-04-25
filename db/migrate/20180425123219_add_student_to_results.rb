class AddStudentToResults < ActiveRecord::Migration
  def change
    add_reference :results, :student, index: true, foreign_key: true
  end
end
