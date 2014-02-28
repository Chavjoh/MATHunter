class TutorialsController < ApplicationController
  
  def index
    @tutorials = Tutorial.all
  end
  
  def show
    @tutorial = Tutorial.find(params[:id])
  end
  
  def new
    @tutorial = Tutorial.new
  end
  
  def edit
    @tutorial = Tutorial.find(params[:id])
  end
  
  def create
    @tutorial = Tutorial.new(get_params)
    
    if @tutorial.save
      redirect_to @tutorial
    else
      render 'new'
    end
  end
  
  def update
    @tutorial = Tutorial.find(params[:id])
    
    if @tutorial.update(get_params)
      redirect_to @tutorial
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
    params[:tutorial].permit(:title, :difficulty, :description)
  end
end
