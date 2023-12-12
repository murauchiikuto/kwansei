class AddCategoryToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :category, :string
  end
end
