class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def hobby 
    posts_for_branch(params[:action])
  end

  def study
    posts_for_branch(params[:action])
  end

  def team
    posts_for_branch(params[:action])
  end

  def get_posts
    branch = params[:action]
    search = params[:search]
    category = params[:category]

    if category.blank? && search.blank?
      posts = Post.by_branch(branch).all
    elsif category.blank? && search.present?
      posts = Post.by_branch(branch).search(search)
    elsif category.present? && search.blank?
      posts = Post.by_category(branch, category)
    else 
      posts = Post.by_category(branch, category).search(search)
    end
  end

  private

  def posts_for_branch(branch)
    @categories = Category.where(branch: branch)
    @posts = get_posts.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js { render partial: 'posts/posts_pagination_page' }
    end
  end

  def get_posts
    Post.limit(30)
  end
end
