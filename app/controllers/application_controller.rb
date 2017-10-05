class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_blog_from_domain


  def require_user
    unless user_signed_in?
      flash[:notice] = "You need to be signed-in to view this page"
      redirect_to new_user_session_url 
    end
  end
  
  def set_blog_from_domain
    @blog = Blog.find_by domain: request.domain
    puts "\n\n BLOG: #{@blog}\n\n"

    unless @blog
      puts "\n\n CANNAE FIND BLOG\n\n"
      flash[:notice] = "No blog at #{request.domain}" 
      redirect_to blogs_path
    end
  end

end
