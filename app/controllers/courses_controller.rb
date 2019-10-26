class CoursesController < ApplicationController
  def index
    @courses = Course.order(created_at: :desc)
  end

  def show
    @course = Course.find(params[:id])
  end


end
