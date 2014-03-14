class CommentsController < ApplicationController
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @comment = @chapter.comments.create(params[:comment].permit(:message))
    redirect_to chapter_path(@chapter)
  end
end
