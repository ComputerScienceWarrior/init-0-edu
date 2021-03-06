class ApplicationController < ActionController::Base
    helper_method :current_student
    helper_method :logged_in_student?
    helper_method :set_course_session_id
    helper_method :current_course
    helper_method :authentication_required
    helper_method :require_admin
    
    def current_student    
        Student.find_by_id(session[:student_id])  
    end

    def logged_in_student?
        !current_student.nil?  
    end

    def current_course
        Course.find_by_id(session[:course_id])
    end

    def authentication_required
        if current_student.nil?
            redirect_to root_path
        end
    end

    def require_admin
        unless current_student.is_admin
          redirect_to root_path
        end
    end

end
