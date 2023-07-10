class BlogsController < ApplicationController
  before_action :authenticate_user
  def index
    blogs = Blog.all
    render json: blogs
  end

  def create
    raise StandardError.new, "Title and Content Required." if params[:title].blank? || params[:content].blank?

    blog = Blog.new
    blog.title = params[:title]
    blog.content = params[:content]
    blog.user_id = current_user.id

    if blog.save
      render json: { message: 'Blog created successfully' }, status: 200
    end
  rescue => e
    render json: { message: e.message }, status: 400
  end

end
