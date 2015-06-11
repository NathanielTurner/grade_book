class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
    def teacher
      unless session[:type] == "teacher" && Teacher.find_by_id(session[:teacher_id])
        redirect_to login_path notice: 'Must be logged in as a teacher to view this page.'
      end
    end
  private
    def student
      unless session[:type] == "student" && Student.find_by_id(session[:student])
        redirect_to login_path notice: 'Must be logged in as a student to view this page.'
      end
    end
  private  
    def parent
      unless session[:type] == "parent" && Parent.find_by_id(session[:parent_id])
        redirect_to login_path notice: 'Must be logged in as a parent to view this page.'
      end
    end


  def authorize_parent
    self.parent
  end

  def authorize_student
    self.student
  end

  def authorize_teacher
    self.teacher
  end

end
