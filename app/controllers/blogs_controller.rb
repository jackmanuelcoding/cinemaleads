class BlogsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new

    authorize @blog
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    authorize @blog

    if @blog.save
      redirect_to blogs_path, notice: "#{@blog.title} was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blog = Blog.find(params[:id])

    authorize @blog
  end

  def update
    @blog = current_user.blogs.find(params[:id])

    authorize @blog

    if @blog.update(blog_params)
      redirect_to @blog, notice: "#{@blog.title} was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])

    authorize @blog

    @blog.destroy
    redirect_to blogs_path,
                status: :see_other,
                notice: "#{@blog.title} was destroyed."
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
