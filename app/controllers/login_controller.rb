class LoginController < ApplicationController
  def login
    if request.post?
      type = params[:type]
      if type == "teacher"
        teacher = Teacher.find_by_email(params[:email])
        if teacher && teacher.authenticate(params[:password])
          session[:teacher_id] = teacher.id
          redirect_to root_path, notice: "Teacher login successful"
        else
          flash.now[:notice] = "Your teacher data is not on record."
        end
      elsif type == "parent"
        parent = Parent.find_by_email(params[:email])
        if parent && parent.authenticate(params[:password])
          session[:parent_id] = parent.id
          redirect_to root_path, notice: "Parent login successful"
        else
          flash.now[:notice] = "Your Parent data is not on record."
        end
      elsif type == "student"
        student = Student.find_by_email(params[:email])
        if student && student.authenticate(params[:password])
          session[:student_id] = student.id
          redirect_to root_path, notice: "Student login successful"
        else
          flash.now[:notice] = "Your student data is not on record."
        end
      end
    end
  end

  def logout
    session[:student_id] = nil
    session[:teacher_id] = nil
    session[:parent_id] = nil
    redirect_to login_path, :notice => "Successfully logged out."
  end
end
