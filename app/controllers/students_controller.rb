class StudentsController < ApplicationController
   
    before_action :authenticate_user!, only: [:new, :create]

    def index

        if params[:search] == nil
            @students= Student.all
        elsif params[:search] == ''
            @students= Student.all
        else
            @students = Student.where("title LIKE ? ",'%' + params[:search] + '%')
        end


       
        @students = @students.page(params[:page]).per(3)
    end


    def new
        @student = Student.new
    end
    
    def create
        student = Student.new(student_params)

        student.user_id = current_user.id 

        if student.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @student = Student.find(params[:id])
        @comments = @student.comments
        @comment = Comment.new
    end

    def edit
        @student = Student.find(params[:id])
    end
    
    def update
        student = Student.find(params[:id])
        if student.update(student_params)
          redirect_to :action => "show", :id => student.id
        else
          redirect_to :action => "new"
        end
    end
    def destroy
        student = Student.find(params[:id])
        student.destroy
        redirect_to action: :index  
    end

    def one
        @students = Student.all
      end
    
      def two
        @students = Student.all
      end
    
      def three
        @students = Student.all
      end

        def four
          @students = Student.all
        end




    private
      def student_params
        params.require(:student).permit(:genre, :major, :grade, :title, :category, :image)
    end
end
