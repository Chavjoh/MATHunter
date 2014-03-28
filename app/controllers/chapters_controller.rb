class ChaptersController < ApplicationController
  before_filter :require_login, :except => [:index, :show]
  
  def index
    @tutorial = get_related_tutorial
    @chapters = @tutorial.chapters.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @tutorial = get_related_tutorial
    @chapter = Chapter.find(params[:id])
    @chapters = @tutorial.chapters
    
    @comments = @chapter.comments.paginate(page: params[:page])
    @comment = Comment.new 
  end
  
  def new
    @tutorial = get_related_tutorial
    @chapter = Chapter.new
  end
  
  def edit
    @tutorial = get_related_tutorial
    @chapter = Chapter.find(params[:id])
    
    if @tutorial.user_id != current_user.id
      redirect_to(:tutorials, notice: 'Access Denied !')
    end
  end
  
  def create
    @tutorial = get_related_tutorial
    @chapter = Chapter.new(get_params)
    @chapter.tutorial_id = @tutorial.id
    
    if @chapter.save
      redirect_to tutorial_chapter_path(@tutorial, @chapter)
    else
      render 'new'
    end
  end
  
  def update
    @tutorial = get_related_tutorial
    @chapter = Chapter.find(params[:id])
    
    if @chapter.update(get_params)
      redirect_to tutorial_chapter_path(@tutorial, @chapter)
    else
      render 'edit'
    end
  end
  
  def destroy
    @tutorial = get_related_tutorial
    @chapter = Chapter.find(params[:id])
    
    if @tutorial.user_id != current_user.id
      redirect_to(:tutorials, notice: 'Access Denied !')
    else
      @chapter.destroy
      redirect_to tutorial_chapters_path(@tutorial)
    end
  end
  
  private
  
  def get_params
    params[:chapter].permit(:title, :content)
  end
  
  def get_related_tutorial
    Tutorial.find(params[:tutorial_id])
  end
end
