module ApplicationHelper
    private
      def logged_in?
        @current_user ||= Customer.find(session[:user_id]) if session[:user_id]
      end
end
