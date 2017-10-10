class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def require_user
    unless user_signed_in?
      flash[:notice] = "You need to be signed-in to view this page"
      redirect_to new_user_session_url 
    end
  end
  
  def set_blog_from_domain
    subdomains = request.subdomains << request.domain
    domain = subdomains.join(".")

    @blog = Blog.find_by domain: domain

    unless @blog
      flash[:notice] = "No blog at #{request.domain}" 
      redirect_to blogs_path
    end
  end

end
