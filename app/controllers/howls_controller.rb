class HowlsController < ApplicationController
  before_action :set_howl, only: [:show, :edit, :update, :destroy]
  before_action :your_page, only: [:show, :destroy]
  before_action :edit_restriction, only: [:edit]
  def index
    @howls = Howl.all
  end

  def new
    if params[:back]
      get_howl
    else
      @howl = Howl.new
      @howl.user_id = current_user.id
    end
  end

  def create
    @howl = Howl.new(howl_params)
    @howl.user_id = current_user.id
    # if @howl.save
    #   redirect_to howls_path, notice: "作成しました"
    # else
    #   render "new"
    # end
      respond_to do |format|
        if @howl.save
          HowlMailer.howl_mail(@howl).deliver
          format.html { redirect_to @howl, notice: '作成しました' }
          format.json { render :show, status: :created, location: @howl }
        else
          format.html { render :new }
          format.json { render json: @howl.errors, status: :unprocessable_entity }
        end
      end
  end

  def show
    @favorite = current_user.favorites.find_by(howl_id: @howl.id)
  end

  def edit
  end


  def update
    if @howl.update(howl_params)
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
    @howl.user_id = current_user.id
    render :new if @howl.invalid?
  end

  private
    def howl_params
      params.require(:howl).permit(:content)
    end

    def set_howl
      @howl = Howl.find(params[:id])
    end

    def get_howl
      @howl = Howl.new(howl_params)
    end

    def your_page
      unless logged_in?
        redirect_to new_session_path
      end
    end

    def edit_restriction
      unless logged_in? && @howl.user_id == current_user.id
        redirect_to user_path
      end
    end
end
