class CreateStudentUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :student_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
