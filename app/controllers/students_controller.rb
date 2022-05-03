class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def index
        render json: Student.all, status: :ok
    end
    
    def show
        render json: Student.find(params[:id]), status: :ok
    end

    def update
        student = Student.find(params[:id])
        new_data = student_params
        render json: student.update(new_data), status: :accepted
    end

    def create
        student = Student.new(student_params)
        if student.valid?
            render json: Student.create(student_params), status: :accepted
        else
            render json: {error: student.errors}
        end
    end

    def destroy
        student = Student.find(params[:id])
        render json: student.destroy, status: :accepted
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def not_found
        render json:{error: 'student not found'}, status: :not_found
    end

end
