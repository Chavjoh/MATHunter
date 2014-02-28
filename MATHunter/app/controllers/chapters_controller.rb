class ChaptersController < ApplicationController
  
  def index
    @chapters = Chapter.all
  end
  
  def show
    @chapter = Chapter.find(params[:id])
  end
  
  def new
    @chapter = Chapter.new
  end
  
  def edit
    @chapter = Chapter.find(params[:id])
  end
  
  def create
    @chapter = Chapter.new(get_params)
    
    if @chapter.save
      redirect_to @chapter
    else
      render 'new'
    end
  end
  
  def update
    @chapter = Chapter.find(params[:id])
    
    if @chapter.update(get_params)
      redirect_to @chapter
    else
      render 'edit'
    end
  end
  
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    
    redirect_to chapters_path
  end
  
  private
  
  def get_params
    params[:chapter].permit(:title, :difficulty, :description)
  end
end
