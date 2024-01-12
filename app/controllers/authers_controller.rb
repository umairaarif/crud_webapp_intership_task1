class AuthersController < ApplicationController

  def index
    @authers = if params[:search]
      Auther.where("name LIKE ?", "%#{params[:search]}%")
    else
      Auther.all
    end
  end

  def show
    @auther = Auther.find(params[:id])
  end
  
  def new
    @auther = Auther.new
  end

  def create
    @auther = Auther.new(auther_params)

    if @auther.save
      redirect_to @auther
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @auther = Auther.find(params[:id])
  end

  def update
    @auther = Auther.find(params[:id])

    if @auther.update(auther_params)
      redirect_to @auther
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @auther = Auther.find(params[:id])
    @auther.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def auther_params
    params.require(:auther).permit(:name)
  end
end
