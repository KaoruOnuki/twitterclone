class HowlsController < ApplicationController
  before_action :set_howl, only: [:show, :edit, :update, :destroy]
  
  def index
    @howls = Howl.all
  end
  
  def new
    if params[:back]
      get_howl
    else
      @howl = Howl.new
    end
  end
  
  def create
    @howl = Howl.create(content: params[:howl][:content])
    if @howl.save
      redirect_to howls_path, notice: "作成しました"
    else
      render "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @howl.update(content: params[:howl][:content])
      redirect_to howls_path, notice: "編集しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @howl.destroy
    redirect_to howls_path, notice: "削除しました"
  end
  
  def confirm
    get_howl
    render :new if @howl.invalid?
  end
  

  
private
  def set_howl
    @howl = Howl.find(params[:id])
  end
  
  def get_howl
    @howl = Howl.new(content: params[:howl][:content])
  end
  
end