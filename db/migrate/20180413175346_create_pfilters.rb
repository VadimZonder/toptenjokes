class CreatePfilters < ActiveRecord::Migration
  def change
    create_table :pfilters do |t|
      t.string :pfilter
      t.string :email

      t.timestamps null: false
    end
  end
end
