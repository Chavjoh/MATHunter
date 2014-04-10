class TutorialsController < ApplicationController
  before_filter :require_login, :except => [:index, :show, :highlights, :search]
  
  def index
    if params[:search]
      @tutorials = Tutorial.search(params[:search]).order("created_at DESC")
    else
      @tutorials = Tutorial.paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def show
    @tutorial = Tutorial.find(params[:id])
    
    redirect_to tutorial_chapters_path(@tutorial)
  end
  
  def voteGood
    @tutorial = Tutorial.find(params[:id])
    score = @tutorial.score
    score += 1
    Tutorial.update(params[:id], {"score" => score})
    redirect_to tutorial_chapters_path(@tutorial)
  end
  
  def voteBad
    @tutorial = Tutorial.find(params[:id])
    score = @tutorial.score
    score -= 1
    Tutorial.update(params[:id], {"score" => score})
    redirect_to tutorial_chapters_path(@tutorial)
  end
  
  def highlights
    @tutorials = Tutorial.all
    
    render 'highlights'
  end
  
  def search
    @tutorials = Tutorial.search(params[:search])
  end
  
  def new
    @tutorial = Tutorial.new
  end
  
  def edit
      @tutorial = Tutorial.find(params[:id])
      
      if @tutorial.user_id != current_user.id
        redirect_to(:tutorials, alert: 'Access Denied !')
      end
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
    
    if @tutorial.user_id != current_user.id
      redirect_to(:tutorials, alert: 'Access Denied !')
    else
      @tutorial.destroy
      redirect_to tutorials_path
    end
  end
  
  private
  
  def get_params
    params[:tutorial].permit(:description, :difficulty, :image, :title)
  end
  
end
