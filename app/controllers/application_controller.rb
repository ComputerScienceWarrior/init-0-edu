class ApplicationController < ActionController::Base
    helper_method :current_student
    helper_method :current_teacher
    helper_method :logged_in_student?
    helper_method :logged_in_teacher?
    
    def current_student    
        Student.find_by(id: session[:student_id])  
    end

    def current_teacher  
        Teacher.find_by(id: session[:teacher_id])  
    end

    def logged_in_student?
        !current_student.nil?  
    end

    def logged_in_teacher?
        !current_teacher.nil?  
    end
end
