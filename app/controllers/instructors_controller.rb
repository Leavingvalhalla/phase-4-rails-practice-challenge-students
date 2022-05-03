class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def index
        render json: Instructor.all, status: :ok
    end
    
    def show
        render json: Instructor.find(params[:id]), status: :ok
    end

    def update
        instructor = Instructor.find(params[:id])
        new_data = instructor_params
        render json: instructor.update(new_data), status: :accepted
    end

    def create
        render json: Instructor.create(instructor_params), status: :accepted
    end

    def destroy
        instructor = Instructor.find(params[:id])
        render json: instructor.destroy, status: :accepted
    end

    def instructor_params
        params.permit(:name)
    end

    def not_found
        render json: {error: 'instructor not found'}, status: :not_found
    end

end


