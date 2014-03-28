class CommentsController < ApplicationController
  before_filter :require_login
  
  def create
    # Create comment in chapter
    @chapter = Chapter.find(params[:chapter_id])
    @comment = @chapter.comments.create(params[:comment].permit(:content))
    
    # Add user ID from session
    @comment.user_id = session[:user_id]
    @comment.save
    
    redirect_to tutorial_chapter_path({:tutorial_id => @chapter.tutorial.id, :id => params[:chapter_id]})
  end
end
