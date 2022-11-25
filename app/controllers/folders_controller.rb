class FoldersController < ApplicationController
  def index
    @folder = Folder.new
    @folders = Folder.all
  end

  def show
    @folder = Folder.find(params[:id])
    @folders = Folder.all
    @memos = Memo.where(folder_id: @folder.id).all
  end

  def edit
    @folder = Folder.find(params[:id])
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user_id = current_user.id
    if @folder.save
      redirect_to folders_path, notice: "You have created folder successfully."
    else
      @folders = Folder.all
      render 'index'
    end
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      redirect_to folders_path, notice: "You have updated folder successfully."
    else
      render "edit"
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    redirect_to folders_path
  end

  private

  def folder_params
    params.require(:folder).permit(:user_id, :name)
  end
end
