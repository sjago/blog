class CommentsController < ApplicationController

	def create

    @post = Post.find(params[:post_id])
    attrs = params.require(:comment).permit(:content).merge(post_id: @post.id)
		# @comment = @post.comments.build(attrs)
		@comment = Comment.new(attrs)

    if @comment.save
			redirect_to post_path(@post)
		else
			render 'posts/show'
		end
  end


end