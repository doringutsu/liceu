class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :idnp
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :p_first_name
      t.string :p_last_name
      t.string :p_phone
      t.string :p_email
      t.timestamps null: false
    end
    add_reference :students, :subject, index: true, foreign_key: true
    add_reference :students, :group, index: true, foreign_key: true
  end
end
