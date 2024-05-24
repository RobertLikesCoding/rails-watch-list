class CommentsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @comment = @list.comments.build(comment_params)

    if @comment.save
      @comment = Comment.new
      redirect_to list_path(@list, anchor: 'comments_section')
    else
      redirect_to list_path(@list), alert: 'There was an error creating the comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
