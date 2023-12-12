class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :genre
      t.string :major
      t.string :grade
      t.string :title
      t.text :qestion

      t.timestamps
    end
  end
end
