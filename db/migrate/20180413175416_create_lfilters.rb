class CreateLfilters < ActiveRecord::Migration
  def change
    create_table :lfilters do |t|
      t.string :lfilter
      t.string :email

      t.timestamps null: false
    end
  end
end
