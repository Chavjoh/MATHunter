class ChaptersController < ApplicationController
  
  def index
    @tutorial = get_related_tutorial
    @chapters = @tutorial.chapters.all
  end
  
  def show
    @tutorial = get_related_tutorial
    @chapter = Chapter.find(params[:id])
  end
  
  def new
    @tutorial = get_related_tutorial
    @chapter = Chapter.new
  end
  
  def edit
    @tutorial = get_related_tutorial
    @chapter = Chapter.find(params[:id])
  end
  
  def create
    @tutorial = get_related_tutorial
    @chapter = Chapter.new(get_params)
    
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
    @chapter.destroy
    
    redirect_to tutorial_chapters_path(@tutorial)
  end
  
  private
  
  def get_params
    params[:chapter].permit(:title, :content)
  end
  
  def get_related_tutorial
    Tutorial.find(params[:tutorial_id])
  end
end
