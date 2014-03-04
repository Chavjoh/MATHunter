class TutorialsController < ApplicationController
  
  def index
    @tutorials = Tutorial.all
  end
  
  def show
    @tutorial = Tutorial.find(params[:id])
  end
  
  def highlights
    @tutorial = Tutorial.all
    
    render 'highlights'
  end
  
  def new
    @tutorial = Tutorial.new
  end
  
  def edit
    @tutorial = Tutorial.find(params[:id])
  end
  
  def create
    @tutorial = Tutorial.new(get_params)
    @tutorial.score = 0
    @tutorial.user_id = current_user.id
    
    if @tutorial.save
      redirect_to tutorial_path(@tutorial)
    else
      render 'new'
    end
  end
  
  def update
    @tutorial = Tutorial.find(params[:id])
    
    if @tutorial.update(get_params)
      redirect_to tutorial_path(@tutorial)
    else
      render 'edit'
    end
  end
  
  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy
    
    redirect_to tutorials_path
  end
  
  private
  
  def get_params
    params[:tutorial].permit(:descrption, :difficulty, :image, :title)
  end
end
