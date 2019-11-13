class PostsController < ApplicationController	

	def index
		@posts = Post
      .order(created_at: :desc)
      .offset((page - 1) * per_page)
      .limit(per_page)
      .includes(:categories, :votes)

    @total_pages = (Post.count / per_page.to_f).ceil
  end
    
  def create

		attrs = params.require(:post).permit(:title, :content, category_ids: [])
		@post = Post.new(attrs)
    #Calculate Slug
    #Add to post before saving
    #@post.slug = @post.calculate_slug
# require 'pry'; binding.pry
    if @post.save
      redirect_to post_path(@post)		
    else
      render :new
    end

	end

  def new
    
    @post = Post.new

  end

	def show

		@post = Post.find_by(id: params[:id]) || Post.find_by(slug: params[:id])

    if @post
      @comments = @post.comments.includes(:votes)
      @comment = @post.comments.build

    else
      render 'shared/not_found', status: 404
	  end
	end

	def edit

		@post = Post.find(params[:id])
		
	end

	def update

		@post = Post.find(params[:id])
		attrs = params.require(:post).permit(:title, :content)

		if @post.update(attrs)
      redirect_to post_path(@post)
    else
      render :edit
    end
			
	end

  private

    def per_page
      5
    end

    def page
      return 1 if !params[:page]

      params[:page].to_i
    end    

end