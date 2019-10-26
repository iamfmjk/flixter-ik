class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_enrollment


  def show
  end

  def check_enrollment
    unless current_user.enrolled_courses.include?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: 'You are not enrolled in this course'
    end
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
