class SessionsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id
            if @student.is_admin
                redirect_to admin_students_path
            else
                redirect_to student_path(@student)
            end
        else
            redirect_to login_path
        end
    end

    def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        @student = Student.from_omniauth(access_token)
        login_path(@student)

        # Access_token is used to authenticate request made from the rails application to the google server
        @student.google_token = access_token.credentials.token

        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        @student.google_refresh_token = refresh_token if refresh_token.present?
        @student.save
        session[:student_id] = @student.id
        redirect_to student_path(@student)
      end

    def destroy
        reset_session
        redirect_to login_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
