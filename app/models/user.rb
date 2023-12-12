class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :students, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_students, through: :likes, source: :student
    has_many :comments, dependent: :destroy
    def already_liked?(student)
        self.likes.exists?(student_id: student.id)
      end
end