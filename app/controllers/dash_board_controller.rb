class DashBoardController < ApplicationController
  before_action :authorize_teacher, only: [:teacher, :index]
  before_action :authorize_parent, only: [:parent]
  before_action :authorize_student, only: [:student]


  def show
    if session[:teacher_id]
      redirect_to controller: 'dash_board', action: 'teacher'
    elsif session[:student_id]
      redirect_to controller: 'dash_board', action: 'student'
    elsif session[:parent_id]
      redirect_to controller: 'dash_board', action: 'parent'
    else
      redirect_to login_path, notice: "Restricted, log in first."
    end
  end

  def teacher
  end

  def parent
    @parent = Parent.find_by_id(session[:parent_id])
    @grades = Student.find_by_id(@parent.student_id).grades.all
  end

  def student
    @student = Student.find_by_id(session[:student_id])
    @grades = @student.grades.all
  end

  def index
    @grades = Grade.all
    @students = Student.all
    @parents = Parent.all
  end

end
