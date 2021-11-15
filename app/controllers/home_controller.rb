class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    # @current_user_id=session[:current_user_id]
    #render "index", locals: { user_name: current_user.first_name }
    if current_user
      redirect_to todos_path
    else
      render "index"
    end
  end
end
