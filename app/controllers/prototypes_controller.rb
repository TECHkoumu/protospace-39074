class PrototypesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, ]
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
    #フォームに初期値を設定する
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @prototype.user = current_user
    if @prototype.save
      redirect_to root_path
    else
      render :new
      #保存がうまくいかなくても入力済みデータを保持する
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && @prototype.user == current_user
      redirect_to action: :index
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit # 編集ページを再表示する
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end
end
